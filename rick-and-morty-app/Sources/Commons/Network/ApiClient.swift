//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

final class ApiClient: ApiProtocol {

  private enum Constants {
    static let defaultNetworkError = "network"
  }

  private var session: URLSession {
    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true
    // time (seconds) that a task will wait for data to arrive
    configuration.timeoutIntervalForRequest = 30
    // time (seconds) of the whole resource request to complete
    configuration.timeoutIntervalForResource = 300
    return URLSession(configuration: configuration)
  }
}

// MARK: - Exposed methods
extension ApiClient {

  func asyncRequest<T: Decodable>(
    endpoint: EndpointProvider,
    responseModel: T.Type
  ) async throws -> T {

    do {
      let (data, response) = try await session.data(
        for: endpoint.asURLRequest()
      )
      return try self.manageResponse(data: data, response: response)

    } catch let error as ApiError {
      throw error

    } catch {
      throw ApiError(
        errorCode: Constants.defaultNetworkError,
        message: "Unknown API error \(error.localizedDescription)"
      )
    }
  }

  func asyncRequestGetByUrl<T: Decodable>(
    responseModel: T.Type,
    urlString: String
  ) async throws -> T {

    guard let url = URL(string: urlString) else {
      throw ApiError(
        errorCode: "url",
        message: "URL error"
      )
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = RequestMethod.get.rawValue

    do {
      let (data, response) = try await session.data(
        for: urlRequest
      )
      return try self.manageResponse(data: data, response: response)

    } catch let error as ApiError {
      throw error

    } catch {
      throw ApiError(
        errorCode: Constants.defaultNetworkError,
        message: "Unknown API error \(error.localizedDescription)"
      )
    }
  }

}

// MARK: - Private methods
private extension ApiClient {

  func manageResponse<T: Decodable>(
    data: Data,
    response: URLResponse
  ) throws -> T {

    guard let response = response as? HTTPURLResponse
    else {
      throw ApiError(
        errorCode: Constants.defaultNetworkError,
        message: "Invalid HTTP response"
      )
    }

    switch response.statusCode {

      case 200...299:
        do {
          return try JSONDecoder().decode(T.self, from: data)
        } catch {
          throw ApiError(
            errorCode: "Decoding Data Error",
            message: "Error decoding data: \(error.localizedDescription)"
          )
        }

      default:
        guard let decodedError = try? JSONDecoder().decode(ApiError.self, from: data)
        else {
          throw ApiError(
            statusCode: response.statusCode,
            errorCode: Constants.defaultNetworkError,
            message: "Unknown backend error"
          )
        }

        if response.statusCode == 403 {
          throw ApiError(
            statusCode: response.statusCode,
            errorCode: decodedError.errorCode,
            message: "Check if this error can be caused by an expired token: \(decodedError)"
          )
        }

        if response.statusCode == 405 {
          throw ApiError(
            statusCode: response.statusCode,
            errorCode: decodedError.errorCode,
            message: "Check if this error can be caused by invalid headers in request: \(decodedError)"
          )
        }

        throw ApiError(
          statusCode: response.statusCode,
          errorCode: decodedError.errorCode,
          message: decodedError.message
        )
    }
  }

}


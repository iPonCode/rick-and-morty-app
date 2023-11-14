//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

protocol EndpointProvider {

  var scheme: String { get }
  var baseURL: String { get }
  var path: String { get }
  var method: RequestMethod { get }
  // A token can be declared here (not necessary for Rick and Morty API)
  var queryItems: [URLQueryItem]? { get }
  var body: [String: Any]? { get }
  var mockFile: String? { get }
}

extension EndpointProvider {

  var scheme: String {
    "https"
  }

  var baseURL: String {
    "rickandmortyapi.com"
  }

  // can recover here the token from keychain when necessary
  // var token: String { … }

  func asURLRequest() throws -> URLRequest {

    var urlComponents = URLComponents()
    urlComponents.scheme = scheme
    urlComponents.host =  baseURL
    urlComponents.path = path

    if let queryItems = queryItems {
      urlComponents.queryItems = queryItems
    }

    guard let url = urlComponents.url else {
      throw ApiError(
        errorCode: "url",
        message: "URL error"
      )
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue

    // Aditional Headers like Content-Type or Token can be added here…
    // urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    if let body {
      urlRequest.httpBody = body.percentEncoded()
    }

    return urlRequest
  }
}


//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Combine

final class CharacterListViewViewModel: ObservableObject {
  
  @Published private(set) var list: [Character] = []
  @Published private(set) var info: Info = .empty
  @Published private(set) var error: ApiError?

  // let mockedApiClient = MockApiClient()
  let apiClient = ApiClient()
  var areMoreItems: String? { info.next }
  
  //  init() {
  //    Task {
  //      await asyncAllCharacters()
  //    }
  //  }
}

extension CharacterListViewViewModel {

  @MainActor
  func asyncAllCharacters() async {

    let endPoint = CharactersEndpoints.character

    Task.init {
      do {
        print("+* requesting now")
        let allCharactersResponse = try await apiClient.asyncRequest( // mockedApiClient.asyncRequest(
          endpoint: endPoint,
          responseModel: AllCharactersResponse.self,
          addAditionalHeaders: false
        )
        print("+* response now")
        list = allCharactersResponse.results.map(CharacterMapper.map)
        info = InfoMapper.map(allCharactersResponse.info)

      } catch let error as ApiError {
        self.error = error
      }
    }
  }

  @MainActor
  func fetchNextCharactersPage(_ urlString: String) async {

    Task.init {
      do {
        print("+* requesting by url now")
        let allCharactersResponse = try await apiClient.asyncRequestGetByUrl(
          responseModel: AllCharactersResponse.self,
          urlString: urlString
        )
        print("+* response by url now")
        list
          .append(
            contentsOf: allCharactersResponse
              .results
              .map(CharacterMapper.map)
          )
        info = InfoMapper.map(allCharactersResponse.info)

      } catch let error as ApiError {
        self.error = error
      }
    }
  }

}

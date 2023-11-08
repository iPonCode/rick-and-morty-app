//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Combine

final class CharacterListViewViewModel: ObservableObject {

	@Published private(set) var list: [Character] = []
  @Published private(set) var error: ApiError?

//  init() {
//    Task {
//      await asyncAllCharacters()
//    }
//  }

  @MainActor
  func asyncAllCharacters() async {

    let endPoint = CharactersEndpoints.character
    // let mockedApiClient = MockApiClient()
    let apiClient = ApiClient()

    Task.init {
      do {
        print("requesting now")
        let allCharactersResponse = try await apiClient.asyncRequest( // mockedApiClient.asyncRequest(
          endpoint: endPoint,
          responseModel: AllCharactersResponse.self,
          addAditionalHeaders: false
        )
        print("response now")
        list = allCharactersResponse.results.map(CharacterMapper.map)

      } catch let error as ApiError {
        self.error = error
      }
    }
  }

}

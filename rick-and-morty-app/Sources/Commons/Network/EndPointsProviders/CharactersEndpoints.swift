//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

enum CharactersEndpoints: EndpointProvider {
  case character

  var path: String {
    switch self {
      case .character:
        return "/api/character"
    }
  }

  var method: RequestMethod {
    switch self {
      case .character:
        return .get
    }
  }

  var queryItems: [URLQueryItem]? { nil }

  var body: [String: Any]? { nil }

  var mockFile: String? {
    switch self {
      case .character:
        return "_getAllCharactersResponse"
    }
  }
}


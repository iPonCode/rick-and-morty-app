//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

enum CharacterStatusResponse: String, Codable {

  case alive = "Alive"
  case dead = "Dead"
  case `unknown` = "unknown"

  var text: String {
    switch self {
      case .alive, .dead:
        return rawValue
      case .unknown:
        return "Unknown"
    }
  }
}


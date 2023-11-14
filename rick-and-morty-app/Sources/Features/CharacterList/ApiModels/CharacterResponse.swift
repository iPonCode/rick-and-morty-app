//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct CharacterResponse: Codable {

  let id: Int
  let name: String
  let status: CharacterStatusResponse
  let species: String
  let type: String
  let gender: CharacterGenderResponse
  let origin: OriginResponse
  let location: SingleLocationResponse
  let image: String
  let episode: [String]
  let url: String
  let created: String
}


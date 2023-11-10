//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct Character: Identifiable,
                  Equatable,
                  Hashable {

  let id: Int
  let name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      numberOfEpisodes,
      created: String
}

extension Character {
  static var previewData: Character {
    Character(
      id: 1,
      name: "Rick Sanchez",
      status: "Alive",
      species: "Human",
      type: "",
      gender: "Male",
      origin: "Earth (C-137)",
      location: "Citadel of Ricks",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      numberOfEpisodes: "52",
      created: "2017-11-04T18:48:46.250Z"
    )
  }
}


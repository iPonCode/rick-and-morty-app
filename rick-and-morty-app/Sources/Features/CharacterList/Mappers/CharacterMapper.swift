//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class CharacterMapper: Mapper {

	static func map(
		_ from: CharacterResponse
	) -> Character {

    Character(
      id: from.id,
      name: from.name,
      status: from.status.rawValue,
      species: from.species,
      type: from.type,
      gender: from.gender.rawValue,
      origin: from.origin.name,
      location: from.location.name,
      image: from.image,
      numberOfEpisodes: String(from.episode.count),
      created: from.created
    )
	}
}


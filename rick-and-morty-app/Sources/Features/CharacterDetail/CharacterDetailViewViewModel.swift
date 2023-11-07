//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Combine

final class CharacterDetailViewViewModel: ObservableObject {

	private(set) var character: String

	init(character: String) {
		self.character = character
	}
}

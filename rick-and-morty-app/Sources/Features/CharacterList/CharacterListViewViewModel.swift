//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Combine

final class CharacterListViewViewModel: ObservableObject {

	@Published private(set) var list: [String] = (1...25).map { "Character" + " " + String($0) }
}

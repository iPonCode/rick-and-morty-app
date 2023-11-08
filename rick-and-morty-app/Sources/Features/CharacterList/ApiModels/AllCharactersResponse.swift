//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct AllCharactersResponse: Codable {

    struct Info: Codable {
        let count,
            pages: Int
        let next,
            prev: String?
    }

    let info: Info
    let results: [CharacterResponse]
}


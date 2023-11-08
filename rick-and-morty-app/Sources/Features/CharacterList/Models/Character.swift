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

    let id,
        name,
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


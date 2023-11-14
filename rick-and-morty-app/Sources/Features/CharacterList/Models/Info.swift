//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

struct Info {

  let count, pages: Int
  let next, prev: String?
}

extension Info {

  static var empty: Info {
    Info(
      count: 0,
      pages: 0,
      next: nil,
      prev: nil
    )
  }
}


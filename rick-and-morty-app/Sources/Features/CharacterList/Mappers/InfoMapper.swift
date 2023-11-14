//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

class InfoMapper: Mapper {

  static func map(
    _ from: InfoResponse
  ) -> Info {

    Info(
      count: from.count,
      pages: from.pages,
      next: from.next,
      prev: from.prev
    )
  }
}


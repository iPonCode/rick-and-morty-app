//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import Foundation

func debugLog(_ log: String) {
#if DEBUG
  let filterTag = "+*"
    print(filterTag,log)
#endif
}


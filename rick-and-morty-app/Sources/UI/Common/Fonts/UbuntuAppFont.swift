//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

enum UbuntuAppFont {
  case regular28,
       regular22,
       regular18,
       regular16,
       regular14,
       medium16,
       medium20,
       bold17,
       bold22

  var type: UbuntuFont {
    switch self {
      case .regular28,
           .regular22,
           .regular18,
           .regular16,
           .regular14: return .regular
      case .medium16,
           .medium20: return .medium
      case .bold17,
           .bold22: return .bold
    }
  }

  var size: CGFloat {
    switch self {
      case .regular28: return 28
      case .regular22: return 22
      case .regular18: return 18
      case .regular16: return 16
      case .regular14: return 14
      case .medium16: return 16
      case .medium20: return 20
      case .bold17: return 17
      case .bold22: return 22
    }
  }
}

extension Font {

  static func ubuntuAppFont(
    _ font: UbuntuAppFont
  ) -> Font {

    ubuntu(
      font.type,
      size: font.size
    )
  }
}


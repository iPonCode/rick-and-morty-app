//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

enum UbuntuFont: String, CaseIterable {

  case regular = "Ubuntu-Regular",
       italic = "Ubuntu-Italic",
       light = "Ubuntu-Light",
       lightItalic = "Ubuntu-LightItalic",
       medium = "Ubuntu-Medium",
       mediumItalic = "Ubuntu-MediumItalic",
       bold = "Ubuntu-Bold",
       boldItalic = "Ubuntu-BoldItalic"
}

extension Font {

  static func ubuntu(
    _ type: UbuntuFont,
    size: CGFloat
  ) -> Font {

    .custom(
      type.rawValue,
      size: size
    )
  }
}


//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct BigSymmetricalProgressStyle: ProgressViewStyle {

  var proxy: GeometryProxy

  func makeBody(
    configuration: Configuration
  ) -> some View {

    let progress = configuration.fractionCompleted ?? 0.0

    RoundedRectangle(cornerRadius: 6)
      .fill(.clear)
      .frame(height: 18)
      .frame(width: proxy.size.width)

      .overlay(alignment: .center) {
        RoundedRectangle(cornerRadius: 6)
          .fill(.black)
          .frame(width: proxy.size.width * progress)
      }
  }
}


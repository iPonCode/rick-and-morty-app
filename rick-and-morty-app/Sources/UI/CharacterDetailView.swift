//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct CharacterDetailView: View {

  @ObservedObject var viewModel: CharacterDetailViewViewModel

  var body: some View {

    VStack {
      Text(viewModel.character)
        .font(.appFont(.regular28))
    }
    .navigationTitle("Character Detail")
  }

}


#Preview {
  CharacterDetailView(
    viewModel: CharacterDetailViewViewModel(character: "Character 33")
  )
}


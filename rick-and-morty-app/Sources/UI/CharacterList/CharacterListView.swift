//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
	
	@ObservedObject var viewModel: CharacterListViewViewModel

  var body: some View {

    ScrollView(.vertical) {

      LazyVStack {

        ForEach(
          viewModel.list,
          id: \.self
        ) { character in

          NavigationLink(
            destination: CharacterDetailView(
              viewModel: CharacterDetailViewViewModel(
                character: character.name
              ))) {
                CharacterItemView(character: character)
              }
              .frame(height: 120)
//              .containerRelativeFrame(
//                .vertical,
//                count: 5, // TODO: calculate number of elements based on current screen height
//                spacing: 4
//              )
              .scrollTransition { content, phase in
                content
                  .scaleEffect(phase.isIdentity ? 1.0 : 0.6)
                  .opacity(phase.isIdentity ? 1.0 : (1.0 - phase.value))
//                  .grayscale(phase.value)
              }
        }
      }
      .safeAreaPadding(.all)
//      .scrollTargetLayout()
    }
    .scrollIndicators(.hidden)
//    .scrollTargetBehavior(.paging)
//    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    .navigationTitle("Character List")
  }

}

struct CharacterListView_Previews: PreviewProvider {

  static var previews: some View {
    CharacterListView(
      viewModel: CharacterListViewViewModel()
    )
  }
}


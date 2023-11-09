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
              /*
              .containerRelativeFrame(
                .vertical,
                // TODO: calculate number of elements based on current screen height
                count: 5,
                spacing: 4
              )
              */
              .scrollTransition { content, phase in
                content
                  .scaleEffect(phase.isIdentity ? 1.0 : 0.5, anchor: .trailing)
                  .opacity(phase.isIdentity ? 1.0 : 0.75)
                  .grayscale(phase.isIdentity ? 0.0 : 1.25)
                  .blur(radius: phase.isIdentity ? 0.0 : 5.0)
              }
        }
      }
      .safeAreaPadding(.all)
      .scrollTargetLayout()
    }
    .scrollIndicators(.hidden)
    //.scrollTargetBehavior(.paging)
    .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
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


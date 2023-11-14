//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct CharacterListView: View {

  @ObservedObject var viewModel: CharacterListViewViewModel
  //@State private var scrollId: Character.ID?

  var body: some View {

    ScrollView(.vertical) {

      LazyVStack {

        ForEach(
          viewModel.list
        ) { character in

          NavigationLink(
            destination: CharacterDetailView(
              viewModel: CharacterDetailViewViewModel(
                character: character.name
              ))) {
                CharacterItemView(character: character) // TODO: Chache Image instead use AsyncImage
              }
              .frame(height: 120)
              .scrollTransition { content, phase in
                content
                  .scaleEffect(phase.isIdentity ? 1.0 : 0.5, anchor: .trailing)
                  .opacity(phase.isIdentity ? 1.0 : 0.75)
                  .grayscale(phase.isIdentity ? 0.0 : 1.25)
                  .blur(radius: phase.isIdentity ? 0.0 : 5.0)
              }
        }

        if let url = viewModel.areMoreItems {
          VStack {
            Group {
              Text("There are ") +
              Text("\(viewModel.list.count)").font(.ubuntuAppFont(.bold17)) +
              Text(" records, loading more…")
            }
            .font(.ubuntuAppFont(.regular16))

            ProgressView()
              .controlSize(.extraLarge)
              .tint(.purple)
              .onAppear {
                Task {
                  await viewModel.fetchNextCharactersPage(url)
                }
              }
          }

        } else {
          Group {
            Text("No more Characters, ") +
            Text("\(viewModel.list.count)").font(.ubuntuAppFont(.bold17)) +
            Text(" loaded.")
          }
          .font(.ubuntuAppFont(.regular16))
        }
      }
      .safeAreaPadding(.all)
      .scrollTargetLayout()
    }
    //.scrollPosition(id: $scrollId)
    //.defaultScrollAnchor(.bottom)
    .scrollTargetBehavior(.paging)
    //.scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
    .scrollIndicators(.hidden)
    //.navigationTitle("Character List")
  }
  
}

struct CharacterListView_Previews: PreviewProvider {

  static var previews: some View {
    CharacterListView(
      viewModel: CharacterListViewViewModel()
    )
  }
}


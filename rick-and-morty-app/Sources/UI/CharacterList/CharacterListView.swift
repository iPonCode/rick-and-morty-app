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
                CharacterItemView(character: character)
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
          ProgressView()
            .controlSize(.extraLarge)
            .tint(.purple)
            .onAppear {
              print("+* LOAD MORE ITEMS APPEARING")
              Task {
                await viewModel.fetchNextCharactersPage(url)
              }
            }
            .onDisappear {
              print("+* DISAPPEARING")
            }
        }
      }
      .safeAreaPadding(.all)
      .scrollTargetLayout()
    }
    //.scrollPosition(id: $scrollId)
    //.defaultScrollAnchor(.bottom)
    //.scrollTargetBehavior(.paging)
    .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
    .scrollIndicators(.hidden)
    .navigationTitle("Character List")
    //.onChange(of: scrollId) { oldValue, newValue in
    //    print(newValue ?? "")
    //}
  }
  
}

struct CharacterListView_Previews: PreviewProvider {

  static var previews: some View {
    CharacterListView(
      viewModel: CharacterListViewViewModel()
    )
  }
}


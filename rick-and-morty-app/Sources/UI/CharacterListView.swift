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
                ItemView(character: character)
              }
//          .scrollTransition { content, phase in
//            content
//              .scaleEffect(phase.isIdentity ? 1.0 : 0.7)
//          }
        }
      }
//      .safeAreaPadding(.vertical)
    }
    .scrollIndicators(.hidden)
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

struct ItemView: View {

  let character: Character
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      AsyncImage(url: URL(string: character.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 112)
          .clipShape(RoundedRectangle(cornerRadius: 13.0))
      } placeholder: {
        Rectangle()
          .fill(.clear)
          .frame(width: 112, height: 112)
          .overlay(alignment: .center) {
            ProgressView()
              .tint(.black)
          }
      }
      VStack(alignment: .leading, spacing: 4) {
        Text(character.name)
          .font(.appFont(.regular28))
          .foregroundColor(.primary)
        
        Group {
          Text(character.status)
            .foregroundColor(.purple) +
          Text(" · ")
            .foregroundColor(.gray)
            .bold() +
          Text(character.gender)
            .foregroundColor(.indigo)
        }
        .font(.ubuntuAppFont(.medium16))
        
        Text(character.location)
          .font(.ubuntuAppFont(.regular16))
          .foregroundColor(.gray)
      }
      Spacer()
    }
  }
}

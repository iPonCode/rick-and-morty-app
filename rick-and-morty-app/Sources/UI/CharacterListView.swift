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
		List(
			viewModel.list,
			id: \.self
		) { character in
			NavigationLink(
				destination: CharacterDetailView(
					viewModel: CharacterDetailViewViewModel(
            character: character.name
					))) {
            HStack(alignment: .top) {
              AsyncImage(url: URL(string: character.image)) { image in
                 image
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(height: 112)
             } placeholder: {
               Rectangle()
                 .fill(.clear)
                 .frame(width: 112, height: 112)
                 .overlay(alignment: .center) {
                   ProgressView()
                     .tint(.black)
                 }
             }
              Text(character.name)
            }
					}
		}
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


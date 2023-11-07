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
		) { item in
			Text(item)
		}
		.navigationTitle("Character List")
	}

}

#Preview {
	CharacterListView(
		viewModel: CharacterListViewViewModel()
	)
}


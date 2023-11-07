//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct MainView: View {

	@EnvironmentObject var main: Main

	var body: some View {

		if main.lauchScreenHasBeenAlreadyDisplayed {

			let viewModel = CharacterListViewViewModel()

			NavigationView {
				CharacterListView(
					viewModel: viewModel
				)
			}
			.transition(.move(edge: .top))

		} else {
			LaunchScreenView()
				.transition(.move(edge: .bottom))
		}
	}

}

struct MainView_Previews: PreviewProvider {

	static var previews: some View {
		let main = Main()

		MainView()
			.environmentObject(main)
			.previewDisplayName("Main")
	}
}


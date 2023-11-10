//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct MainView: View {

	@EnvironmentObject var main: Main

  // The viewModel was created here instead inside conditional,
  // for launching the first request as soon as possible
  let viewModel = CharacterListViewViewModel()

  var body: some View {

    Group {

      if main.lauchScreenHasBeenAlreadyDisplayed {

        NavigationView {
          // let viewModel = CharacterListViewViewModel()
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
    .onAppear {
      Task {
        await viewModel.asyncAllCharacters()
      }
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


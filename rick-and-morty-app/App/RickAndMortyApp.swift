//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

@main
struct RickAndMortyApp: App {

  // MARK: - Configurations
  init() {
		// printAppFontFamilies()
		configureNavigationBarAppearance()
	}

	var body: some Scene {

		WindowGroup {

      // MARK: - Initialization & Dependency injection
      let main = Main()
			MainView()
				.environmentObject(main)

		}
	}
}

// MARK: - Private Methods
private extension RickAndMortyApp {

	func configureNavigationBarAppearance() {
		let appearance = UINavigationBarAppearance()
		let attributesBig: [NSAttributedString.Key: Any] = [
			.font: UIFont(
        name: UbuntuFont.bold.rawValue,
				size: 30
			)!
		]
		let attributesSmall: [NSAttributedString.Key: Any] = [
			.font: UIFont(
        name: UbuntuFont.regular.rawValue,
				size: 15
			)!
		]
		appearance.largeTitleTextAttributes = attributesBig
		appearance.titleTextAttributes = attributesBig
		appearance.backButtonAppearance.normal.titleTextAttributes = attributesSmall
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().compactAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
	}

	func printAppFontFamilies() {

		for family in UIFont.familyNames {
      debugLog("\(family)")

			for name in UIFont.fontNames(forFamilyName: family) {
        debugLog("\t\t\(name)")
			}
		}
	}

}


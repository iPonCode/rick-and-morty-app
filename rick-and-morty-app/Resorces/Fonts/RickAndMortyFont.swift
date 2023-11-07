//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

enum RickAndMortyFont: String, CaseIterable {
	
	/// Rick_And_Morty.ttf font family is 'GetSchwifty-Regular':
	/// uncomment printAppFontFamilies() RickAndMortyApp.swift line 14 to see this name in console
	case regular = "GetSchwifty-Regular"
}

extension Font {

	static func rickAndMorty(
		_ type: RickAndMortyFont,
		size: CGFloat
	) -> Font {
		.custom(type.rawValue, size: size)
	}
}


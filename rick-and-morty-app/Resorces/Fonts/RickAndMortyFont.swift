//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

enum RickAndMortyFont: String, CaseIterable {
	
	case regular = "GetSchwifty-Regular" // Rick_And_Morty.ttf
}

extension Font {

	static func rickAndMorty(
		_ type: RickAndMortyFont,
		size: CGFloat
	) -> Font {
		.custom(type.rawValue, size: size)
	}
}


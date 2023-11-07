//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

enum AppFont {
	case regular28,
			 regular22,
			 regular18,
			 regular16,
			 regular14

	var type: RickAndMortyFont {
		switch self {
		case .regular28,
				 .regular22,
				 .regular18,
				 .regular16,
				 .regular14: return .regular
		}
	}

	var size: CGFloat {
		switch self {
		case .regular28: return 28
		case .regular22: return 22
		case .regular18: return 18
		case .regular16: return 16
		case .regular14: return 14
		}
	}
}

extension Font {
	static func appFont(
		_ font: AppFont
	) -> Font {
		rickAndMorty(
			font.type,
			size: font.size
		)
	}
}


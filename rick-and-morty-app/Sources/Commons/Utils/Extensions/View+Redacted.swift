//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 08/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

extension View {

	@ViewBuilder
	func redacted(
		if condition: @autoclosure () -> Bool
	) -> some View {

		redacted(
			reason: condition() ? .placeholder : []
		)
	}
}


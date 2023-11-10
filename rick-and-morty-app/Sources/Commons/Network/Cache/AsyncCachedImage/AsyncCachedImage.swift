//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct AsyncCachedImage: View {

	@StateObject private var handler = AsyncCachedImageHandler()
	let url: String

	var body: some View {

		ZStack {
			if let data = handler.data,
				 let image = UIImage(data: data) {
				Image(uiImage: image)
					.resizable()
				// TODO: refactor AsyncCachedImage with states to allow
				// 			 apply this modifiers in the View and not here.
					.frame(width: 120, height: 120)
					.aspectRatio(contentMode: .fit)
			}
		}
		.task {
			await handler.load(url)
		}
	}
}

#Preview {
	AsyncCachedImage(
//		url: "https://rickandmortyapi.com/api/character/avatar/249.jpeg"
		url: Character.previewData.image
	)
}


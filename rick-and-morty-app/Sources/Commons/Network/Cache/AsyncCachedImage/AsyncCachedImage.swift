//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 09/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct AsyncCachedImage<Content: View>: View {

	@StateObject private var handler = AsyncCachedImageHandler()
	let url: String

	/// Need this `@ViewBuilder` content to return a differents Views depending on state,
	/// This is a clousure used to pass through the phase `AsyncImagePhase`,
	/// (same type used by `AsyncImage`) to comunicate with any View that uses `AsyncCachedImage`.
	/// The `@ViewBuilder` attribute indicates SwiftUI that this Content can be any kind of View
	@ViewBuilder let content: (AsyncImagePhase) -> Content

	var body: some View {

		ZStack {

			switch handler.state {
			case .idle, .fetching:
				content(.empty)
			case .success(let imageData):
				if let image = UIImage(data: imageData) {
					content(
						.success(
							Image(uiImage: image
							)))
				} else {
					content(
						.failure(
							ApiError(
								errorCode: "invalidData",
								message: "Invalid Image Data"
					)))
				}
			case .failure(let error):
				content(.failure(error))
			}
		}
		.task {
			await handler.load(url)
		}
	}
}

#Preview {
	AsyncCachedImage(
		url: Character.previewData.image
	) { contetn in
		EmptyView()
	}
}


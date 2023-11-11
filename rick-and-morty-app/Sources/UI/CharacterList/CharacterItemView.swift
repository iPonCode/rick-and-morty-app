//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI

struct CharacterItemView: View {

  let character: Character

  var body: some View {

		// Simply use here `AsyncImage` instead our custom`AsyncCachedImage` and
		// check the performance in xcode > Debug Navigator tab > Network.
		// Run the app, while Scrolling down, check Receiving and Sending Rates graph,
		// then scroll up and check that if you are using Cached version no aditional
		// network activity occur due loading images from chache.
		// Also, do some test by disconnect from internet and scroll up and down again.

		// AsyncImage(url: URL(string: character.image)) { phase in
		AsyncCachedImage(url: character.image) { phase in

      HStack(alignment: .center, spacing: 12) {

				switch phase {
				case .success(let image):
					image
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(height: 112)
						.clipShape(RoundedRectangle(cornerRadius: 13.0))

				case .empty, .failure:

					let isLoading = phase.error != nil
					RoundedRectangle(cornerRadius: 13.0)
						.fill(.gray.opacity(0.4))
						.frame(width: 112, height: 112)

						.overlay(alignment: .center) {
							Image("placeholder")
								.resizable()
								.frame(width: 88, height: 88)
								.tint(.gray)
								.blur(radius: 0.75)
								.overlay(alignment: .topLeading) {
									if isLoading {
										ProgressView()
											.progressViewStyle(.circular)
											.controlSize(.small)
											.tint(.purple)
											.frame(width: 18, height: 18)
											.background {
												Circle()
													.fill(.gray.opacity(0.25))
											}

									} else {
										Image(systemName: "exclamationmark.circle")
											.resizable()
											.frame(width: 18, height: 18)
											.padding(4)
											.foregroundColor(.purple.opacity(0.75))
									}
								}
						}

				@unknown default:
					EmptyView()
				}

        VStack(alignment: .leading, spacing: 4) {
          Text(character.name)
            .font(.appFont(.regular28))
            .foregroundColor(.primary)

          Group {
            Group {
              Text(character.status)
                .foregroundColor(.purple) +
              Text(" | ")
                .foregroundColor(.gray)
                .bold() +
              Text(character.gender)
                .foregroundColor(.indigo)
            }
            .font(.ubuntuAppFont(.medium16))

            Text(character.location)
              .font(.ubuntuAppFont(.regular16))
              .foregroundColor(.gray)
          }
          .redacted(if: phase.image == nil)
        }
        Spacer()
      }
    }
  }

}

struct CharacterItemView_Previews: PreviewProvider {

  static var previews: some View {
    CharacterItemView(
      character: Character.previewData
    )
  }
}


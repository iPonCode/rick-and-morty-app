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
		
		HStack(alignment: .center, spacing: 12) {
			
//			if let image = phase.image {
			AsyncCachedImage(url: character.image)
//					.resizable()
//					.aspectRatio(contentMode: .fit)
					.frame(height: 112)
					.clipShape(RoundedRectangle(cornerRadius: 13.0))
				
//			} else {
//				let isLoading = phase.error != nil
//				RoundedRectangle(cornerRadius: 13.0)
//					.fill(.gray.opacity(0.4))
//					.frame(width: 112, height: 112)
//				
//					.overlay(alignment: .center) {
//						Image("placeholder")
//							.resizable()
//							.frame(width: 88, height: 88)
//							.tint(.gray)
//							.blur(radius: 0.75)
//							.overlay(alignment: .topLeading) {
//								if isLoading {
//									ProgressView()
//										.progressViewStyle(.circular)
//										.controlSize(.small)
//										.tint(.purple)
//										.frame(width: 18, height: 18)
//										.background {
//											Circle()
//												.fill(.gray.opacity(0.25))
//										}
//									
//								} else {
//									Image(systemName: "exclamationmark.circle")
//										.resizable()
//										.frame(width: 18, height: 18)
//										.padding(4)
//										.foregroundColor(.purple.opacity(0.75))
//								}
//							}
//					}
//			}
			VStack(alignment: .leading, spacing: 4) {

				Group {
					Text(String(character.id)) +
					Text(" · ")
						.foregroundColor(.gray)
						.bold() +
					Text(character.name)
				}
				.foregroundColor(.primary)
				.font(.appFont(.regular28))

				Group {
					Group {
						Text(character.status)
							.foregroundColor(.purple) +
						Text(" | ")
							.foregroundColor(.gray)
							.bold() +
						Text(character.gender)
							.foregroundColor(.indigo) +
						Text(" | ")
							.foregroundColor(.gray)
							.bold() +
						Text(String(character.id))
							.foregroundColor(.indigo)
					}
					.font(.ubuntuAppFont(.medium16))
					
					Text(character.location)
						.font(.ubuntuAppFont(.regular16))
						.foregroundColor(.gray)
				}
//				.redacted(if: phase.image == nil)
			}
			Spacer()
		}
		/*
    AsyncImage(url: URL(string: character.image)) { phase in

      HStack(alignment: .center, spacing: 12) {

        if let image = phase.image {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 112)
            .clipShape(RoundedRectangle(cornerRadius: 13.0))

        } else {
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
		*/
  }

}

struct CharacterItemView_Previews: PreviewProvider {

  static var previews: some View {
    CharacterItemView(
      character: Character.previewData
    )
  }
}


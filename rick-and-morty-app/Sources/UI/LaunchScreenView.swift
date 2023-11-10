//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI
import AVFoundation

struct LaunchScreenView: View {

	@EnvironmentObject var main: Main

  @State private var progressAmount = 0.0
  let totalAmount = 4 / 0.1
  let timer = Timer.publish(
    every: 0.1,
    on: .main,
    in: .common
  ).autoconnect()

	@State private var player = AVPlayer()
	private let videoName = "launchScreen"

	var body: some View {

		GeometryReader { proxy in
			PlayerView(
				videoName: videoName,
				player: player
			)
			.aspectRatio(contentMode: .fill)
			.frame(width: proxy.size.width, height: proxy.size.height)
			.onAppear {
				player.play()
			}
			.onDisappear {
				player.pause()
			}

			// MARK: item Did Play To End Time
			.onReceive(
				NotificationCenter.default.publisher(
					for: NSNotification.Name(
						rawValue: "AVPlayerItemDidPlayToEndTimeNotification"
					)
				)
			) { _ in // item
				withAnimation {
					main.lauchScreenHasBeenAlreadyDisplayed = true
				}
			}

			// MARK: did Become Active
			.onReceive(
				NotificationCenter.default.publisher(
					for: UIApplication.didBecomeActiveNotification
				)
			) { _ in
				player.play()
			}

			// MARK: will Resign Active
			.onReceive(
				NotificationCenter.default.publisher(
					for: UIApplication.willResignActiveNotification
				)
			) { _ in
				player.pause()
			}
      .overlay(alignment: .center) {
        ProgressView(
          value: progressAmount,
          total: totalAmount
        )
        .progressViewStyle(
          BigSymmetricalProgressStyle(proxy: proxy)
        )
        .offset(
          CGSize(
            width: 0,
            height: proxy.size.height / 4
          )
        )
        .onReceive(timer) { _ in
          if progressAmount < totalAmount {
            progressAmount += 1
          }
        }
      }
		}
		.ignoresSafeArea()
	}
}

struct LaunchScreenView_Previews: PreviewProvider {

  static var previews: some View {
    LaunchScreenView()
  }
}


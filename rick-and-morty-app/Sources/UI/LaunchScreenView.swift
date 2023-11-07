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
		}
		.ignoresSafeArea()
	}
}

#Preview {
	LaunchScreenView()
}


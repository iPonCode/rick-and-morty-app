//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import SwiftUI
import AVFoundation

struct PlayerView: UIViewRepresentable {
	private let videoName: String
	private let player: AVPlayer

	init(
		videoName: String,
		player: AVPlayer
	) {
		self.videoName = videoName
		self.player = player
	}

	func updateUIView(
		_ uiView: UIView,
		context: UIViewRepresentableContext<PlayerView>
	) {}

	func makeUIView(
		context: Context
	) -> UIView {
		OneTimePlayerUIView(
			videoName: videoName,
			player: player
		)
	}
}


//
//  rick-and-morty-app
//
//  Created by Simón Aparicio on 07/11/2023.
//  Copyright © 2023 iPon.es All rights reserved.
//

import UIKit
import AVFoundation

class OneTimePlayerUIView: UIView {

  private let playerLayer = AVPlayerLayer()

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(videoName: String,
       player: AVPlayer,
       videoGravity: AVLayerVideoGravity = .resizeAspect) {

    super.init(frame: .zero)

    guard let fileUrl = Bundle.main.url(
      forResource: videoName,
      withExtension: "mp4")
    else { return }

    let asset = AVAsset(url: fileUrl)
    let item = AVPlayerItem(asset: asset)

    player.replaceCurrentItem(with: item)
    player.isMuted = true
    playerLayer.player = player
    playerLayer.videoGravity = videoGravity
    layer.addSublayer(playerLayer)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}


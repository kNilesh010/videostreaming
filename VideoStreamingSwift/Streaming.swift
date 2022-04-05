//
//  Streaming.swift
//  Streaming
//
//  Created by Nilesh Kumar on 05/04/22.
//

import Foundation
import AVKit
import AVFoundation

class VideoStreaming{
    
    let playerController = AVPlayerViewController()
    let player = AVPlayer()
    
    private lazy var myView: UIView = {
        let view = playerController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(){}
    
    func addView(with view: UIView){
        view.addSubview(myView)
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: view.topAnchor),
            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func play(url: URL?){
        guard let url = url else {
            return
        }
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        player.replaceCurrentItem(with: playerItem)
        playerController.player = player
        playerController.player?.play()
        
    }
    
    func pause(){
        player.pause()
    }
    
    func clear(){
        
    }
    
}

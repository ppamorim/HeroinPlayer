//
// Created by Pedro Paulo Amorim on 10/03/2015.
// Copyright (c) 2015 Pedro Paulo Amorim. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//

import AVKit
import AVFoundation

public class HeroinPlayer : UIView {
  
  var playerItem: AVPlayerItem? = nil
  var videoPlayer: AVPlayer? = nil
  
  override public class func layerClass() -> AnyClass {
    return AVPlayerLayer.self
  }
  
  public func build() -> HeroinPlayer {
    self.videoPlayer = AVPlayer(playerItem: self.playerItem!)
    setPlayer(self.videoPlayer!)
    setVideoFillMode(AVLayerVideoGravityResizeAspectFill)
    return self
  }
  
  public func start() -> Void {
    videoPlayer?.play()
  }
  
  public func pause() -> Void {
    videoPlayer?.pause()
  }
  
  public func seekToDate(date: NSDate) {
    videoPlayer?.seekToDate(date)
  }
  
  public func seekToTime(time: CMTime) -> Void {
    videoPlayer?.seekToTime(time)
  }
  
  public func kill() -> Void {
    playerItem?.finalize()
    videoPlayer?.finalize()
  }
  
  public func fastChange(videoURL: String) -> Void {
    if isPlaying() {
      pause()
    }
    kill()
    setUrl(videoURL)
    build()
    start()
  }
  
  public func isPlaying() -> Bool {
    return videoPlayer?.status != AVPlayerStatus.Failed
  }
  
  public func getVolume() -> Float {
    return (videoPlayer?.volume)!
  }
  
  public func setUrl(videoURL: String) -> HeroinPlayer {
    self.playerItem = AVPlayerItem(URL: NSURL(string: videoURL)!)
    return self
  }
  
  public func setPlayer(player: AVPlayer) -> HeroinPlayer {
    let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
    layer.player = player
    return self
  }
  
  public func player() -> AVPlayer {
    let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
    return layer.player!
  }
  
  public func setVideoFillMode(fillMode: NSString) -> HeroinPlayer {
    let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
    layer.videoGravity = fillMode as String
    return self
  }
  
  public func videoFillMode() -> NSString {
    let layer: AVPlayerLayer = self.layer as! AVPlayerLayer
    return layer.videoGravity
  }
  
}
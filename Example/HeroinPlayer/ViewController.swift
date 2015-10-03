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

import UIKit
import PureLayout
import HeroinPlayer

class ViewController: UIViewController {
  
  var contraintsUpdated = false;
  
  var heroinPlayer : HeroinPlayer = {
    let heroinPlayer = HeroinPlayer.newAutoLayoutView()
    heroinPlayer.backgroundColor = UIColor.greenColor()
    return heroinPlayer
    }()
  
  override func loadView() {
    super.loadView()
    self.view.addSubview(heroinPlayer)
    self.view.setNeedsUpdateConstraints()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    heroinPlayer
      .setUrl("http://p.demo.flowplayer.netdna-cdn.com/vod/demo.flowplayer/bbb-800.mp4")
      .build()
      .start()
  }
  
  override func updateViewConstraints() {
    if !contraintsUpdated {
      heroinPlayer.autoMatchDimension(.Width, toDimension: .Width, ofView: self.view)
      heroinPlayer.autoMatchDimension(.Height, toDimension: .Width, ofView: heroinPlayer, withMultiplier: 0.5625)
      heroinPlayer.autoCenterInSuperview()
      contraintsUpdated = true
    }
    super.updateViewConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    heroinPlayer.kill()
    super.didReceiveMemoryWarning()
  }
  
  
}
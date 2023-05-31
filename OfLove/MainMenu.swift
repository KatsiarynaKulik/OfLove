//
//  MainMenu.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 31.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {


  @IBOutlet var customBackgroundView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    applyGradientForBackground()
  }

  private func applyGradientForBackground() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [
      UIColor.systemRed.cgColor,
      UIColor.systemPink.cgColor
    ]
    customBackgroundView.layer.addSublayer(gradientLayer)
  }
}


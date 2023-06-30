//
//  MainMenu.swift

//  OfLove
//
//  Created by Katsiaryna Kulik  on 31.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit
import CoreImage

class MainMenuViewController: UIViewController {

  @IBOutlet var customBackgroundView: UIView!

  @IBOutlet var imageViewOfLove: UIImageView!
  @IBOutlet var getStartButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    getStartButton.layer.cornerRadius = 25
//    getStartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
  }
}





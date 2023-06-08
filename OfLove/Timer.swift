//
//  Timer.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 7.06.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class Timer: UIViewController {

  var timer: Timer?
      var counter = 0

  @IBOutlet var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

      // Создаем таймер, вызывающий метод updateTimer каждую секунду
      timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
          }

          @objc func updateTimer() {
              counter += 1
            timerLabel.text = "\(counter)"
                }

                override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Освобождаем ресурсы, которые могут быть восстановлены
                }
            }

//
//  TimerViewController.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 12.06.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

  @IBOutlet var label: UILabel!
  @IBOutlet var timerImageView: UIImageView!
  @IBOutlet var timerLabel: UILabel!
  @IBOutlet var startButton: UIButton!

  var timer: Timer?
  let shapeLayer = CAShapeLayer()
  var durationTimer = 2
  let originalDuration = 2

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.animationCircular()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    startButton.layer.cornerRadius = 25
    timerLabel.text = "\(durationTimer)"
    startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
  }

  @objc func startButtonTapped() {
    if timer == nil {
      startTimer()
    } else {
      stopTimer()
    }
  }

  func startTimer() {
    basicAnimation()

    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timetAction), userInfo: nil, repeats: true)

    // Меняются настройки кнопки
    startButton.setTitle("Stop", for: .normal)
  }

  func stopTimer() {
    timer?.invalidate()
    timer = nil

    shapeLayer.removeAllAnimations()

    // Меняются настройки кнопки
    startButton.setTitle("Start", for: .normal)

    durationTimer = originalDuration
    timerLabel.text = "\(durationTimer)"
  }

  @objc func timetAction() {
    durationTimer -= 1
    timerLabel.text = "\(durationTimer)"

    if durationTimer == 0 {
        // Создаем экземпляр следующего экрана
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FinalScreen")
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)

        // Выполняем переход на следующий экран с использованием навигационного контроллера
        navigationController?.pushViewController(nextViewController, animated: true)
    }
  }

  //MARK: Animation

  func animationCircular() {
    let center = CGPoint(x: timerImageView.frame.width / 2, y: timerImageView.frame.height / 2)
    let endAngle = (-CGFloat.pi / 2)
    let startAngle = 2 * CGFloat.pi + endAngle
    let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)

    shapeLayer.path = circularPath.cgPath
    shapeLayer.lineWidth = 9
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeEnd = 1
    shapeLayer.lineCap = CAShapeLayerLineCap.round
    shapeLayer.strokeColor = #colorLiteral(red: 0.8462027907, green: 0.07871665806, blue: 0.2146175206, alpha: 1).cgColor
    timerImageView.layer.addSublayer(shapeLayer)
  }

  func basicAnimation() {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    basicAnimation.toValue = 0
    basicAnimation.duration = CFTimeInterval(durationTimer)
    basicAnimation.fillMode = CAMediaTimingFillMode.forwards
    basicAnimation.isRemovedOnCompletion = true
    shapeLayer.add(basicAnimation, forKey: "basicAnimation")
  }
}


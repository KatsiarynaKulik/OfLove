//
//  PageForQuestions.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 5.06.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class PageForQuestionsViewController: UIViewController {

  var ofLoveData: OfLoveData!

  // Скрытие и показ кнопки Back
  func hidingButtonBack() {
    if questionLabel.text == ofLoveData.listOfQuestions[ofLoveData.indexZero] {
      backButton.isHidden = true
    } else {
      backButton.isHidden = false
    }
  }
  
  @IBOutlet var questionNumberLabel: UILabel!
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var backButton: UIButton!
  @IBOutlet var nextFinishButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    ofLoveData = OfLoveData()
  }
  
  @IBAction func nextButton(_ sender: UIButton) {
    // Выводим текущий элемент массива в Label
    questionLabel.text = ofLoveData.listOfQuestions[ofLoveData.currentQuestionIndex]
    questionNumberLabel.text = ofLoveData.questionNumber[ofLoveData.currentQuestionNumberIndex]
    
    // Изменяется текст кнопки
    if ofLoveData.currentQuestionIndex == ofLoveData.listOfQuestions.index(before: 36) {
      nextFinishButton.setTitle("Finish", for: .normal)
    }
    
    // Увеличиваем индекс для следующего нажатия
    ofLoveData.currentQuestionIndex += 1
    ofLoveData.currentQuestionNumberIndex += 1

  // Проверяем, достигли ли конца массива после увеличения индекса
    if ofLoveData.currentQuestionIndex >= ofLoveData.listOfQuestions.count {
      // Создаем экземпляр следующего экрана
      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let nextViewController = storyBoard.instantiateViewController(withIdentifier: "timierViewCon")
      nextViewController.modalPresentationStyle = .fullScreen
      self.present(nextViewController, animated: true, completion: nil)
      
      // Выполняем переход на следующий экран с использованием навигационного контроллера
      navigationController?.pushViewController(nextViewController, animated: true)
    }
    hidingButtonBack()
  }
  
  @IBAction func backButton(_ sender: UIButton) {
    // Выводим предыдущий элемент массива в Label
    questionLabel.text = ofLoveData.listOfQuestions[ofLoveData.currentQuestionIndex - 1]
    questionNumberLabel.text = ofLoveData.questionNumber[ofLoveData.currentQuestionNumberIndex - 1]
    
    // Уменьшаем индекс для следующего нажатия
    ofLoveData.currentQuestionIndex -= 1
    ofLoveData.currentQuestionNumberIndex -= 1
    
    hidingButtonBack()
  }
  
  @IBAction func restartButton(_ sender: UIButton) {
    // dismiss(animated: true, completion: nil)
    self.presentingViewController!.dismiss(animated: false, completion: nil)
  }
}







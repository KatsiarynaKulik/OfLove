//
//  PageForQuestions.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 5.06.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class PageForQuestions: UIViewController {

  let listOfQuestions: [String] = [
    "If you could invite someone to dinner (a loved one, a deceased relative, a celebrity), who would you choose?",
    "Would you like to be famous? In what?",
    "Before you make a call, do you happen to rehearse your line? Why?",
    "What would be your «perfect day»?",
    "When was the last time you sang alone? And for someone else?",
    "If you could live to be 90 and have either the mind or body of a 30 year old for the last 60 years, which would you choose?",
    "Do you have a secret premonition of how you will die?",
    "Name three traits that you think both you and your partner have.",
    "What are you most grateful for?",
    "If you could, what would you change about the way you were raised?",
    "In 4 minutes, tell your partner the story of your life in as much detail as possible.",
    "If you could wake up tomorrow with one skill or ability, what would it be?",
    "If a magic crystal could reveal the truth to you, what would you like to know?",
    "Is there something you have been dreaming of doing for a long time? Why haven't you done it yet?",
    "What is the greatest achievement of your life?",
    "What is most valuable to you in friendship?",
    "What is your most treasured memory?",
    "What is your worst memory?",
    "If you knew you were going to die in a year, what would you change about the way you live? Why?",
    "What does friendship mean to you?",
    "What role do love and tenderness play in your life?",
    "Take turns calling your partner his positive traits (exchange five characteristics).",
    "Are relationships warm and close in your family?",
    "How do you feel about your interactions with your mother?",
    "Make three statements each that are true for both of you. For example: «We both feel right now...»",
    "Complete the sentence: «I wish there was someone to share with…» ",
    "If you were going to become a close friend to your partner, what would you tell him: what do you think he should know about you?",
    "Tell your partner what you like about him; speak directly, say things that you could not say to a casual acquaintance.",
    "Share an embarrassing situation or embarrassing moment in your life with your partner.",
    "When was the last time you cried in front of someone? And in loneliness?",
    "Tell your partner what you already appreciate in him (her).",
    "Which topic do you think is too serious to joke about?",
    "If you were to die before the end of the day today without talking to anyone, what would you most regret not saying? Why haven't you said this yet?",
    "Your house with all the property caught fire. After saving your loved ones as well as pets, you have time to run into the house and save something else from the flames. What would you take? Why?",
    "The death of which member of your family would upset you the most? Why?",
    "Share a personal problem and ask your partner how they would handle it. Then ask him what he thinks about your feelings about the issue.",
  ]

  let questionNumber: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36"
  ]

  var currentQuestionIndex = 0
  var currentQQuestionNumberIndex = 0

  @IBOutlet var questionNumberLabel: UILabel!
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func nextButton(_ sender: UIButton) {
    // Выводим текущий элемент массива в Label
    questionLabel.text = listOfQuestions[currentQuestionIndex]
    questionNumberLabel.text = questionNumber[currentQQuestionNumberIndex]

    if currentQuestionIndex == listOfQuestions.count - 1 {
      // Изменяется текст кнопки
      button.setTitle("Finish >", for: .normal)
    }

    // Увеличиваем индекс для следующего нажатия
    currentQuestionIndex += 1
    currentQQuestionNumberIndex += 1

  }
}



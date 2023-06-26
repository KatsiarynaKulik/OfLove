//
//  FinalScreenViewController.swift
//  OfLove
//
//  Created by Katsiaryna Kulik  on 21.06.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class FinalScreenViewController: UIViewController, UIDocumentInteractionControllerDelegate {
  
  @IBOutlet var shareViaButton: UIButton!

  var documentInteractionController: UIDocumentInteractionController!

  override func viewDidLoad() {
    super.viewDidLoad()
    shareViaButton.layer.cornerRadius = 25

    //Создание ссылки на приложение
    let appURL = URL(string: "https://www.apple.com")

    //Создание документа для предоставления ссылки
    let tempFile = try! URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("MyAppLink.txt")

    //Запись ссылки в документ
    try! appURL?.absoluteString.write(to: tempFile, atomically: true, encoding: .utf8)

    //Создаем экземпляр UIDocumentInteractionController
    documentInteractionController = UIDocumentInteractionController(url: tempFile)
    documentInteractionController.delegate = self

  }

  @IBAction func shareButton(_ sender: UIButton) {
    // Открываем панель действий для поделиться ссылкой
    documentInteractionController.presentOptionsMenu(from: sender.frame, in: view, animated: true)  }

  // MARK: - UIDocumentInteractionControllerDelegate
  func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
    // Возвращаем текущий контроллер отображения
    return self
  }
}

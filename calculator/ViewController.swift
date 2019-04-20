//
//  ViewController.swift
//  calculator
//
//  Created by Alexander Skrypnyk on 4/18/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import UIKit

//previousNumber
//numberOnScreen
//perfomingOperation BOOL (true or false)
//operation +-/*
//tag

class ViewController: UIViewController {
  
  @IBOutlet weak var resultLabel: UILabel!
  
  var numberOnScreen: Double = 0
  var previousNumber: Double = 0
  var operation = 0
  var perfomingOperation = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resultLabel.text = ""
  }

  @IBAction func numberPressed(_ sender: UIButton) {
    
    let tag = sender.tag

    if perfomingOperation == true {
      perfomingOperation = false
      resultLabel.text = String(tag - 1)
      numberOnScreen = Double(resultLabel.text!)!
      
    } else {
      
      // число на экране по тегу
    resultLabel.text = resultLabel.text! + String(tag - 1)
    numberOnScreen = Double(resultLabel.text!)!
    }
  }
  
  @IBAction func operationPressed(_ sender: UIButton) {
    
    let tag = sender.tag
    
    // кнопка очистки символов - тег 16
    if tag == 16 {
    
      resultLabel.text = ""
      previousNumber = 0
      numberOnScreen = 0
      operation = 0
    }
    
    // операции по тегу "+"(14), "-"(13), "÷"(11), "*"(12), "="(15), "АС"(16)
    
    if (tag == 11 || tag == 12 || tag == 13 || tag == 14) {
      operation = tag
      perfomingOperation = true
      previousNumber = Double(resultLabel.text!)!

      // вывод символа операции на resultLabel
    if tag == 11 {
        resultLabel.text = "÷"
    } else if tag == 12 {
        resultLabel.text = "*"
    } else if tag == 13 {
        resultLabel.text = "-"
    } else if tag == 14 {
      resultLabel.text = "+"
      }
    }
    
      if tag == 15 {
      
      if operation == 11 {
        resultLabel.text = String(previousNumber / numberOnScreen)

      } else if operation == 12 {
        resultLabel.text = String(previousNumber * numberOnScreen)

      } else if operation == 13 {
        resultLabel.text = String(previousNumber - numberOnScreen)

      } else if operation == 14 {
        resultLabel.text = String(previousNumber + numberOnScreen)
      }
    }
  }
}

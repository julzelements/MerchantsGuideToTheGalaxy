//
//  ViewController.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 9/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var alienNumerals: AlienNumerals!
  var goodsDictionary: AlienGoods!
  var inputHandler: InputHandler!
  
  
  @IBOutlet weak var programInput: UITextView!
  @IBOutlet weak var programOutput: UITextView!
  @IBOutlet weak var testOutput: UITextView!
  
  @IBAction func convertUnits(sender: UIButton) {
    loadObjects()
    handleInput()
    runUITest()
    disposeOfObjects()
  }
  
  func runUITest() {
    //If the text in testOutput and ProgramOutput are the same, the Output will show green
    var testResultColor: UIColor
    testResultColor = (programOutput.text == testOutput.text ? UIColor.greenColor() : UIColor.redColor())
    programOutput.backgroundColor = testResultColor
  }
  
  func loadObjects() {
    alienNumerals = AlienNumerals()
    goodsDictionary = AlienGoods(alienNumerals: alienNumerals)
    inputHandler = InputHandler(numeralDictionary: alienNumerals, goodsDictionary: goodsDictionary)
  }
  
  func disposeOfObjects() {
    alienNumerals = nil
    goodsDictionary = nil
    inputHandler = nil
  }
  
  func handleInput() {
    inputHandler.evaluateUserInputString(programInput.text)
    programOutput.text = inputHandler.parsedOutput.joinWithSeparator("\n")
  }

}


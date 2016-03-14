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
  
  
  override func viewDidLoad() {
    alienNumerals = AlienNumerals()
    goodsDictionary = AlienGoods(alienNumerals: alienNumerals)
    inputHandler = InputHandler(numeralDictionary: alienNumerals, goodsDictionary: goodsDictionary)
//    for statement in testArray {
//      inputHandler.evaluateUserInputString(statement)
//    }
//    let testOutputString = inputHandler.parsedOutput.joinWithSeparator("\n")
//    print(testOutputString)
  }
  
  @IBOutlet weak var programInput: UITextView!
  @IBOutlet weak var programOutput: UITextView!
  @IBOutlet weak var testOutput: UITextView!
  
  @IBAction func convertUnits(sender: UIButton) {
//    print(programInput.text)
    let inputTextAsArray = programInput.text
    inputHandler.evaluateUserInputString(inputTextAsArray)
    
    testOutput.text = inputHandler.parsedOutput.joinWithSeparator(" ")
    runTest()
  }
  
  func runTest() {
    //If the testOutput and the ProgramOutput are the same, the Output will show green
    var testResultColor: UIColor
    testResultColor = (programOutput.text == testOutput.text ? UIColor.greenColor() : UIColor.redColor())
    programOutput.backgroundColor = testResultColor
  }

}


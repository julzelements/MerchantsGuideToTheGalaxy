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
    let alienNumerals = AlienNumerals()
    let goodsDictionary = AlienGoods(alienNumerals: alienNumerals)
    let inputHandler = InputHandler(numeralDictionary: alienNumerals, goodsDictionary: goodsDictionary)
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
    print(programInput.text)
    runTest()
  }
  
  func runTest() {
    //If the testOutput and the ProgramOutput are the same, the Output will show green
    var testResultColor: UIColor
    testResultColor = (programOutput.text == testOutput.text ? UIColor.greenColor() : UIColor.redColor())
    programOutput.backgroundColor = testResultColor
  }

}


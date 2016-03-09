//
//  ViewController.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 9/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var programInput: UITextView!
  @IBOutlet weak var programOutput: UITextView!
  @IBOutlet weak var testOutput: UITextView!
  
  @IBAction func convertUnits(sender: UIButton) {
    runTest()
  }
  
  func runTest() {
    //If the testOutput and the ProgramOutput are the same, the Output will show green
    var testResultColor: UIColor
    testResultColor = (programOutput.text == testOutput.text ? UIColor.greenColor() : UIColor.redColor())
    programOutput.backgroundColor = testResultColor
  }

}


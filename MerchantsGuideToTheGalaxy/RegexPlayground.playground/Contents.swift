//: Playground - noun: a place where people can play

import UIKit
import Foundation


let merchantsDictionarys = MerchantsGuideDictionarys()
let merchantsInputHandler = MerchantsGuideInputHandler()

let romanNumerals = merchantsDictionarys.romanNumerals
var alienNumerals = merchantsDictionarys.alienNumerals
var alienGoods = merchantsDictionarys.alienGoods

func processUserInput(statements: [String], merchantDictionary: MerchantsGuideDictionarys) {
  for statement in statements {
    let statementType = merchantsInputHandler.evaluateUserInputString(statement, romanNumerals: merchantDictionary.romanNumerals)
    switch statementType {
    case .AlienNumeralValueInput: 
    }
    }
  }
}
















//tests.
let testInputA = "glob is I"
let testInputB = "glob glob silver is 34 Credits"
let testInputC = "how much is pish tegj glob glob ?"
let testInputD = "how many Credits is glob prok Silver ?"
let testInputE = "how much wood could a woodchuck chuck if a woodchuck could chuck wood?"



merchantsInputHandler.evaluateUserInputString(testInputA, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputB, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputC, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputD, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputE, romanNumerals: romanNumerals)
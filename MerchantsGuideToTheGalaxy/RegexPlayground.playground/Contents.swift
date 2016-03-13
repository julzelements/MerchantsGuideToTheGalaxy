//: Playground - noun: a place where people can play

import UIKit
import Foundation

let merchantsInputHandler = MerchantsGuideInputHandler()

let romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
var alienNumerals = [String: Int]()
var alienGoods = [String: Int]()

func handleUserStatements(statements: [String], handler: MerchantsGuideInputHandler) {
  for statement in statements {
    let statementType = handler.evaluateUserInputString(statement, romanNumerals: romanNumerals)
    
    switch statementType {
    
    case .WriteAlienNumeral: print("\(statement) is Alien Numeral Value Input")
      let newAlienNumeral = handler.getAlienNumeralFromSentence(statement, romanNumerals: romanNumerals)
      alienNumerals[newAlienNumeral.alienNumeral] = newAlienNumeral.alienValue
    
    case .WriteAlienGoods: print("\(statement) is Alien Goods Value Input")
    if let newAlienGoods = handler.getAlienGoodsFromSentence(statement, alienNumeralDictionary: alienNumerals) {
      alienGoods[newAlienGoods.alienGoods] = newAlienGoods.alienGoodsValue
      }
    
    case .ReadAlienNumeral: print("\(statement) is Alien Numeral Query")
    case .ReadAlienGoods: print("\(statement) is Alien Goods Query")
    case .InvalidUserSentence: print("\(statement) is invalid user sentence")
    }
    
  }
}




//tests.
let testInputA = "glob is I"
let testInputB = "glob glob silver is 34 Credits"
let testInputC = "how much is pish tegj glob glob ?"
let testInputD = "how many Credits is glob prok Silver ?"
let testInputE = "how much wood could a woodchuck chuck if a woodchuck could chuck wood?"

let testAlienDictionary = ["glob": 1, "prok": 5, "pish": 10, "tegj": 50]

merchantsInputHandler.getAlienNumeralsFromSentence(testInputC, alienNumeralDictionary: testAlienDictionary)
merchantsInputHandler.getIntegerFromSentence(testInputB)

handleUserStatements([testInputA, testInputB, testInputC, testInputD, testInputE], handler: merchantsInputHandler)

print(alienNumerals)
print(alienGoods)






merchantsInputHandler.evaluateUserInputString(testInputA, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputB, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputC, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputD, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputE, romanNumerals: romanNumerals)

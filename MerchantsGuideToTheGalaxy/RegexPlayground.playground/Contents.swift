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
    let newAlienNumeral = handler.getAlienNumeralFromWriteAlienNumeralSentence(statement, romanNumerals: romanNumerals)
    alienNumerals[newAlienNumeral.alienNumeral] = newAlienNumeral.alienValue
      
    case .WriteAlienGoods: print("\(statement) is Alien Goods Value Input")
    if let newAlienGoods = handler.getAlienGoodsFromSentence(statement, alienNumeralDictionary: alienNumerals) {
      alienGoods[newAlienGoods.alienGoods] = newAlienGoods.alienGoodsValue
    } else {
      print("errorWriteAlienGoods")
      }
      
    case .ReadAlienNumber: print("\(statement) is Alien Numeral Query")
    if let alienNumber = handler.getAlienNumberValueFromSentence(statement, alienNumeralDictionary: alienNumerals) {
      print("\(alienNumber.description) is \(alienNumber.value)")
    } else {
      print("error ReadAlienNumber")
      }
    case .ReadAlienGoods: print("\(statement) is Alien Goods Query")
    case .InvalidUserSentence: print("\(statement) is invalid user sentence")
    }
  }
}




//tests.



let testInput = "glob is I\nprok is V\npish is X\ntegj is L\nglob glob Silver is 34 Credits\nglob prok Gold is 57800 Credits\npish pish Iron is 3910 Credits\nhow much is pish tegj glob glob ?\nhow many Credits is glob prok Silver ?\nhow many Credits is glob prok Gold ?\nhow many Credits is glob prok Iron ?\nhow much wood could a woodchuck chuck if a woodchuck could chuck wood ?"

let testArray = testInput.componentsSeparatedByString("\n")

let testAlienDictionary = ["glob": 1, "prok": 5, "pish": 10, "tegj": 50]


handleUserStatements(testArray, handler: merchantsInputHandler)
print(alienNumerals)
print(alienGoods)


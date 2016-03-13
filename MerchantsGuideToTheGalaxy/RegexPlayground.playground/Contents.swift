//: Playground - noun: a place where people can play

import UIKit
import Foundation


let merchantsDictionarys = MerchantsGuideDictionarys()
let merchantsInputHandler = MerchantsGuideInputHandler()

let romanNumerals = merchantsDictionarys.romanNumerals
var alienNumerals = merchantsDictionarys.alienNumerals
var alienGoods = merchantsDictionarys.alienGoods

func handleUserStatements(statements: [String], merchantDictionary: MerchantsGuideDictionarys, handler: MerchantsGuideInputHandler) {
  let RNs = merchantDictionary.romanNumerals
  for statement in statements {
    let statementType = handler.evaluateUserInputString(statement, romanNumerals: RNs)
    switch statementType {
    case .AlienNumeralValueInput: print("\(statement) is Alien Numeral Value Input")
      let newAlienNumeral = handler.retrieveAlienNumeralValue(statement, romanNumerals: RNs)
      alienNumerals[newAlienNumeral.alienNumeral] = newAlienNumeral.alienValue
    case .AlienGoodsValueInput: print("\(statement) is Alien Goods Value Input")
    case .AlienNumeralQuery: print("\(statement) is Alien Numeral Query")
    case .AlienGoodsQuery: print("\(statement) is Alien Goods Query")
    case .InvalidUserStatement: print("\(statement) is invalid user input")
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

handleUserStatements([testInputA, testInputB, testInputC, testInputD, testInputE], merchantDictionary: merchantsDictionarys, handler: merchantsInputHandler)

print(alienNumerals)







merchantsInputHandler.evaluateUserInputString(testInputA, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputB, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputC, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputD, romanNumerals: romanNumerals)
merchantsInputHandler.evaluateUserInputString(testInputE, romanNumerals: romanNumerals)

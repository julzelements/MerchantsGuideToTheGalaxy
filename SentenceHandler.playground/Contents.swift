//: Playground - noun: a place where people can play

import UIKit


class SentenceHandler {
  enum SentenceType {
    case WriteAlienNumeral
    case WriteAlienGoods
    case ReadAlienNumber
    case ReadAlienGoods
    case InvalidUserSentence
  }
  
 func evaluateUserInputString(inputString: String, romanNumerals: [String: Int]) -> SentenceType {
    if isWriteAlienNumerals(inputString, romanNumerals: romanNumerals) {
      return .WriteAlienNumeral
    } else if isWriteAlienGoods(inputString) {
      return .WriteAlienGoods
    } else if isReadAlienNumerals(inputString) {
      return .ReadAlienNumber
    } else if isReadAlienGoods(inputString) {
      return .ReadAlienGoods
    }
    return .InvalidUserSentence
  }
  
  func isWriteAlienNumerals(inputString: String, romanNumerals: [String: Int]) -> Bool {
    var isValidQuery = false
    let arrayOfRomanNumerals = [String](romanNumerals.keys)
    for numeral in arrayOfRomanNumerals {
      if inputString.hasSuffix(numeral) {
        isValidQuery = true
      }
    }
    return isValidQuery
  }
  
  func isWriteAlienGoods(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.hasSuffix("Credits") {
      isValidQuery = true
    }
    return isValidQuery
  }
  
  func isReadAlienNumerals(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.containsString("how much is") {
      isValidQuery = true
    }
    return isValidQuery
  }
  
  func isReadAlienGoods(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.containsString("how many Credits is") {
      isValidQuery = true
    }
    return isValidQuery
  }
}








let testInput = "glob is I\nprok is V\npish is X\ntegj is L\nglob glob Silver is 34 Credits\nglob prok Gold is 57800 Credits\npish pish Iron is 3910 Credits\nhow much is pish tegj glob glob ?\nhow many Credits is glob prok Silver ?\nhow many Credits is glob prok Gold ?\nhow many Credits is glob prok Iron ?\nhow much wood could a woodchuck chuck if a woodchuck could chuck wood ?"
let romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
let testArray = testInput.componentsSeparatedByString("\n")
let testAlienDictionary = ["glob": 1, "prok": 5, "pish": 10, "tegj": 50]
let testSentenceHandler = SentenceHandler()
for statement in testArray {
  print(testSentenceHandler.evaluateUserInputString(statement, romanNumerals: romanNumerals))
}

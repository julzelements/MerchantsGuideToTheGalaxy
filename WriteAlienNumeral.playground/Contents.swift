//: Playground - noun: a place where people can play

import UIKit



struct WriteAlienNumeral {
  var alienNumeral: String
  var romanNumeral: String
  init(sentence: String) {
    let words = sentence.componentsSeparatedByString(" ")
    self.alienNumeral = words[0]
    self.romanNumeral = words.last!
  }
  
}

struct WriteAlienGoods {
  var description: String
  var alienValue: String
  var creditValue: Int
  init(sentence: String) {
    let words = sentence.componentsSeparatedByString(" ")
    
    for word in words {
      if let creditValue = Int(word) {
        self.creditValue = creditValue
      }
    }
    
    self.description = ""
    self.alienValue = ""
    
  }
}







let romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
let newStruct = WriteAlienNumeral(sentence: "glob is I")

newStruct.romanNumeral
newStruct.alienNumeral

class surveyQuestions {
  var text: String
  init(text: String) {
    self.text = ""
  }
}
//: Playground - noun: a place where people can play

import UIKit


let testInputB = "glob glob silver is 34 Credits"

func identifyAlienGoods(alienGoodsValueSentence sentence: String) -> String? {
  let words = sentence.componentsSeparatedByString(" ")
  if words.contains("is") {
    if let indexOfTheWordIs = words.indexOf("is") {
      return words[indexOfTheWordIs - 1]
    }
  }
  return nil
}



if identifyAlienGoods(alienGoodsValueSentence: testInputB) == "silver" {
  print("test passed")
} else {
  print("test failed")
}
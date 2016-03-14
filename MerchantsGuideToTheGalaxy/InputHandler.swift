//
//  InputHandler.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 14/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class InputHandler {
  var numerals: AlienNumerals
  var goods: AlienGoods
  var parsedOutput: [String]
  
  init(numeralDictionary: AlienNumerals, goodsDictionary: AlienGoods) {
    self.goods = goodsDictionary
    self.numerals = numeralDictionary
    self.parsedOutput = [String]()
  }
  
  
  func evaluateUserInputString(multilineInput : String) {
    let inputArray = multilineInput.componentsSeparatedByString("\n")
    for inputString in inputArray {
    if isNumeralStatement(inputString) {
      numerals.parseStatement(inputString)
      
    } else if isGoodsStatement(inputString) {
      goods.parseStatement(inputString)
      
    } else if isNumberQuery(inputString) {
      if let query = (numerals.parseQuery(inputString)) {
        let outputString = "\(query.numerals) is \(removeZeros(query.value))"
        parsedOutput.append(outputString)
        //      print("\(query.numerals) is \(removeZeros(query.value))")
      }
      
    } else if isGoodsQuery(inputString) {
      let query = (goods.parseQuery(inputString))
      let outputString = "\(query.quantity) \(query.numerals) is \(removeZeros(query.price)) Credits"
      parsedOutput.append(outputString)
      //      print("\(query.quantity) \(query.numerals) is \(removeZeros(query.price)) Credits")
      
    } else {
      parsedOutput.append("I have no idea what you are talking about")
    }
    }
  }
  
  private func removeZeros(number: Double) -> String {
    if number % 1 == 0 {
      return String(Int(number))
    }
    return String(number)
  }
  
  private func isNumeralStatement(inputString: String) -> Bool {
    let romanNumerals = [String](numerals.romanNumerals.keys)
    for numeral in romanNumerals {
      if inputString.hasSuffix(numeral) {
        return true
      }
    }
    return false
  }
  
  private func isGoodsStatement(inputString: String) -> Bool {
    if inputString.hasSuffix("Credits") {
      return true
    }
    return false
  }
  
  private func isNumberQuery(inputString: String) -> Bool {
    if inputString.containsString("how much is") {
      return true
    }
    return false
  }
  
  private func isGoodsQuery(inputString: String) -> Bool {
    if inputString.containsString("how many Credits is") {
      return true
    }
    return false
  }
  
}
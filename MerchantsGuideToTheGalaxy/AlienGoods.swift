//
//  AlienGoods.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 14/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class AlienGoods {
  var numeralsDictionary: AlienNumerals
  var goodsDictionary = [String: Double]()
  
  init(alienNumerals: AlienNumerals) {
    self.numeralsDictionary = alienNumerals
  }
  
  var knownGoods : [String] {
    return Array(goodsDictionary.keys)
  }
  
  //This function interprets a sentence of type .AlienGoodsValueInput
  //It writes the key:value pair to the goodsDictionary in the class instance
  //
  //Example IO: input: ("glob glob Silver is 68 Credits", ["glob": 1, "prok": 5])
  //           output: goodsDictionary[Silver] = 34
  func parseStatement(statement: String) {
    let words = statement.componentsSeparatedByString(" ")
    var credits = Double()
    var goodsValue = Double()
    var goods = String()

    //Search statement for Double
    for word in words {
      if let number = Double(word) {
        credits = number
      }
    }

    //AlienGood is on LHS of word "is"
    if words.contains("is") {
      if let indexOfTheWordIs = words.indexOf("is") {
        goods = words[indexOfTheWordIs - 1]
      }
    }

    //Create array of all the alienNumerals in the statement
    if let alienNumber = numeralsDictionary.getArrayOfAlienNumerals(statement) {
      goodsValue = numeralsDictionary.readNumber(alienNumber)!
    }

//    Write the calculated goods value to the goodsDictionary
    if credits != 0 {
      goodsDictionary[goods] = (credits / goodsValue)
    }
  }

  //This function interprets a sentence of type .AlienGoodsQuery
  //It returns a tuple containing: alienNumber (String), alienGoods (String), value of Goods (Double)
  //
  //Example IO: input: ("how many Credits is glob prok Iron", ["glob": 1, "prok": 5], ["Iron": 20])
  //           output: ("glob prok", "Iron", 782)
  func parseQuery(query: String) -> (quantity: String, numerals: String, price: Double) {
    var descriptiveQuantity = String()
    var goods = String()
    var price = Double()
    
    let words = query.componentsSeparatedByString(" ")
    
    for word in words {
      if knownGoods.contains(word) {
        goods = word
      }
    }
    
    if let numerals = numeralsDictionary.getArrayOfAlienNumerals(query) {
      if let quantity = numeralsDictionary.readNumber(numerals) {
        if let unitPrice = goodsDictionary[goods] {
          price = unitPrice * quantity
          descriptiveQuantity = numerals.joinWithSeparator(" ")
        }
      }
    }
    return (descriptiveQuantity, goods, price)
  }
  
}
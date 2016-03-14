//
//  AlienNumerals.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 14/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class AlienNumerals {
  
  private let romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
  private var alienDictionary = [String: Int]()
  
  var knownNumerals : [String] {
    return Array(alienDictionary.keys)
  }
  
  //This function parses a string that can be interpreted as an Alien Numeral Assignment
  //It writes the new AlienNumeral to the alienDictionary in this class
  //
  //Example IO: input: ("glob is I")
  //            output: adds new key value pair "glob": 1 to the alienDictionary
  func parseStatement(statement: String) {
    let words = statement.componentsSeparatedByString(" ")
    var newNumeral =  String()
    var newValue = Int()
    
    guard words.count == 3 else {
      print("error: word count of alienNumeralAssignment statement != 3")
      return
    }
    guard words.last != nil else {
      print("error: supplied numeral not found in RomanNumerals dictionary")
      return
    }
    
    newNumeral = words[0]
    newValue = romanNumerals[words.last!]!
    
    //Possible future error handling: Check alienDictionary is not being overwritten
    alienDictionary[newNumeral] = newValue
  }
  
  
  //This function reads an alienNumber and an associated alienNumeralDictionary
  //It returns alienNumber interpreted with the alienNumeralDictionary as a Roman Numeral
  //
  //Example IO: input: (["prok", "glob", "glob"], ["glob": 1, "prok": 5])
  //            output: 7
  func readNumber(alienNumber: [String]) -> Int? {
    var alienValues = [Int]()
    for numeral in alienNumber {
      if let alienValue = alienDictionary[numeral] {
        alienValues.append(alienValue)
      } else {
        return nil
      }
    }
    return calculateRomanNumeral(romanNumeralInts: alienValues)
  }
  
  //This function reads an array of integers as a roman numeral
  //Example IO: input:[10, 1, 5]
  //           output: 14
  private func calculateRomanNumeral(romanNumeralInts numerals: [Int]) -> Int {
    var total = Int()
    let reversed = Array(numerals.reverse())
    
    total += reversed[0]
    for i in 1..<reversed.count {
      let j = i - 1
      if reversed[j] <= reversed[i] {
        total += reversed[i]
      } else if reversed[j] > reversed[i] {
        total -= reversed[i]
      }
    }
    return total
  }
  
}


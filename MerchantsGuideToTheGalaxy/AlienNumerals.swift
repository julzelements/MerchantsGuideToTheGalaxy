//
//  AlienNumerals.swift
//  MerchantsGuideToTheGalaxy
//
//  Created by Julian Scharf on 14/03/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class AlienNumerals {
  
  let romanNumerals:[String: Double] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
  private var alienDictionary = [String: Double]()
  
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
    var newValue = Double()
    
    guard words.count == 3 else {
      print("error: word count of alienNumeralAssignment statement != 3")
      return
    }
  
    newNumeral = words[0]
    newValue = romanNumerals[words.last!]!
    
    //Possible future error handling: Check alienDictionary is not being overwritten
    alienDictionary[newNumeral] = newValue
  }
  
  //This function parses a statement of type .AlienNumberQuery
  //It calculate the value of the AlienNumber using the alienDictionary in this class
  //It returns an optional tuple containing: (value: Double, array of the AlienNumber: [String]
  //
  //Example IO: input: "how much is pish tegj glob glob"
  //            output: (42.0, ["pish", "tegj", "glob", "glob"])
  func parseQuery(query: String) -> (value: Double, numerals: String)? {
    if let numerals = getArrayOfAlienNumerals(query) {
      if let value = readNumber(numerals) {
        let numeralsDescription = numerals.joinWithSeparator(" ")
        return (value, numeralsDescription)
      }
    }
    return nil
  }
  
  func isLegalNumeral(numeral: [Double]) -> Bool {
    //Check for two 5's in a row. 
    //Check for more than 3 digits in a row
    //
    return false
  }
  
  
  //Check four in a row patten
  //Fail: [X, X, X, X]
  //Pass: [X, X, X, I, X]
  private func checkFourInARow(numeral: [Double]) -> Bool {
    let count = numeral.count
    if count >= 4 {
      for i in 0...(count - 4){
        print(count - 3)
        let a = numeral[i]
        let b = numeral[i + 1]
        let c = numeral[i + 2]
        let d = numeral[i + 3]
        
        if a == b && b == c && c == d {
          return false
        }
      }
    }
    return true
  }
  
  //This function reads an alienNumber and an associated alienNumeralDictionary
  //It returns alienNumber interpreted with the alienNumeralDictionary as a Roman Numeral
  //
  //Example IO: input: (["prok", "glob", "glob"], ["glob": 1, "prok": 5])
  //            output: 7
  func readNumber(alienNumber: [String]) -> Double? {
    var alienValues = [Double]()
    for numeral in alienNumber {
      if let alienValue = alienDictionary[numeral] {
        alienValues.append(alienValue)
      } else {
        return nil
      }
    }
    return calculateRomanNumeral(romanNumeralValues: alienValues)
  }
  
  //This function reads an array of Doubles as a roman numeral
  //Example IO: input:[10.0, 1.0, 5.0]
  //           output: 14
  private func calculateRomanNumeral(romanNumeralValues numerals: [Double]) -> Double {
    var total = Double()
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
  
  //This function scans an input statement for alienNumerals(keys) in the alienNumeralDictionary
  //It returns any found numerals ordered in an array or nil if no alienNumerals are found
  //
  //Example IO: input: "glob glob silver is 34 Credits"
  //           output: ["glob", "glob"]
  func getArrayOfAlienNumerals(sentence: String)-> [String]? {
    var alienNumerals = [String]()
    let words = sentence.componentsSeparatedByString(" ")
    for word in words {
      if knownNumerals.contains(word) {
        alienNumerals.append(word)
      }
    }
    if alienNumerals.isEmpty {
      return nil
    } else {
      return alienNumerals
    }
  }
  
}
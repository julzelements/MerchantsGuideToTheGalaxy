//: Playground - noun: a place where people can play

import UIKit



let testAlienDictionary = ["glob": 1, "prok": 5, "pish": 10, "tegj": 50]
let testAlienNumeral = ["pish", "tegj", "glob", "glob"]

func getAlienCompoundNumeralValue(alienNumerals: [String], alienNumeralDictionary: [String: Int]) -> Int {
  var alienValues = [Int]()
  for numeral in alienNumerals {
    if let alienValue = alienNumeralDictionary[numeral] {
    alienValues.append(alienValue)
    }
  }
  return calculateRomanNumeral(romanNumeralInts: alienValues)
}

//This function reads an array of integers as a roman numeral
//Example IO: input[10, 1, 5], output: 14
func calculateRomanNumeral(romanNumeralInts numerals: [Int]) -> Int {
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

getAlienCompoundNumeralValue(testAlienNumeral, alienNumeralDictionary: testAlienDictionary)
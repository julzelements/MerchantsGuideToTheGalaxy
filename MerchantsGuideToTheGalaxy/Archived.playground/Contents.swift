////: Playground - noun: a place where people can play
//
//import UIKit
//
//var str = "Hello, playground"
//
//
//let data = MerchantsGuideData()
//
//data.romanNumerals["V"]
//data.alienNumerals["glob"] = 5
//data.alienNumerals
//
//let testInputA = "glob is I"
//let testInputB = "glob glob silver is 34 Credits"
//let testInputC = "how much is pish tegj glob glob"
//let testInputD = "how many Credits is glob prok Silver"
//
//func isAlienNumeralValue(inputString: String) -> Bool {
//  var isValidQuery = false
//  let arrayOfRomanNumerals = [String](data.romanNumerals.keys)
//  for numeral in arrayOfRomanNumerals {
//    if inputString.hasSuffix(numeral) {
//      isValidQuery = true
//    }
//  }
//  return isValidQuery
//}
//
//func isAlienGoodsValue(inputString: String) -> Bool {
//  var isValidQuery = false
//  if inputString.hasSuffix("Credits") {
//    isValidQuery = true
//  }
//  return isValidQuery
//}
//
//func isAlienNumeralQuery(inputString: String) -> Bool {
//  var isValidQuery = false
//  if inputString.containsString("how much is") {
//    isValidQuery = true
//  }
//  return isValidQuery
//}
//
//
//func isAlienGoodsQuery(inputString: String) -> Bool {
//  var isValidQuery = false
//  if inputString.containsString("how many Credits is") {
//    isValidQuery = true
//  }
//  return isValidQuery
//}
//
//
//print(isAlienNumeralValue(testInputA)) //This one should pass
//isAlienNumeralValue(testInputB)
//isAlienNumeralValue(testInputC)
//isAlienNumeralValue(testInputD)
//
//isAlienGoodsValue(testInputA)
//print(isAlienGoodsValue(testInputB)) //This one should pass
//isAlienGoodsValue(testInputC)
//isAlienGoodsValue(testInputD)
//
//isAlienNumeralQuery(testInputA)
//isAlienNumeralQuery(testInputB)
//print(isAlienNumeralQuery(testInputC)) //This one should pass
//isAlienNumeralQuery(testInputD)
//
//isAlienGoodsQuery(testInputA)
//isAlienGoodsQuery(testInputB)
//isAlienGoodsQuery(testInputC)
//print(isAlienGoodsQuery(testInputD)) //This one should pass
//

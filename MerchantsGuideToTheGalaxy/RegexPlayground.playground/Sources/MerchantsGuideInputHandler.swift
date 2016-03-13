import Foundation

public class MerchantsGuideInputHandler {
  
  //Variable Naming conventions:
  //"prok" - alienNumeral
  //"prok glob glob" - alienNumber
  //if "prok" is assigned a value of 5, alienNumeralValue = 5
  //if "glob" is assigned a value of 1, alienNumeralValue = 1
  
  
  public init(){
    
  }
  
  public enum SentenceType {
    case AlienNumeralValueInput
    case AlienGoodsValueInput
    case AlienNumeralQuery
    case AlienGoodsQuery
    case InvalidUserSentence
  }
  
  public func evaluateUserInputString(inputString: String, romanNumerals: [String: Int]) -> SentenceType {
    if isAlienNumeralValue(inputString, romanNumerals: romanNumerals) {
      return .AlienNumeralValueInput
    } else if isAlienGoodsValue(inputString) {
      return .AlienGoodsValueInput
    } else if isAlienNumeralQuery(inputString) {
      return .AlienNumeralQuery
    } else if isAlienGoodsQuery(inputString) {
      return .AlienGoodsQuery
    }
    return .InvalidUserSentence
  }
  
  func isAlienNumeralValue(inputString: String, romanNumerals: [String: Int]) -> Bool {
    var isValidQuery = false
    let arrayOfRomanNumerals = [String](romanNumerals.keys)
    for numeral in arrayOfRomanNumerals {
      if inputString.hasSuffix(numeral) {
        isValidQuery = true
      }
    }
    return isValidQuery
  }
  
  func isAlienGoodsValue(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.hasSuffix("Credits") {
      isValidQuery = true
    }
    return isValidQuery
  }
  
  func isAlienNumeralQuery(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.containsString("how much is") {
      isValidQuery = true
    }
    return isValidQuery
  }
  
  func isAlienGoodsQuery(inputString: String) -> Bool {
    var isValidQuery = false
    if inputString.containsString("how many Credits is") {
      isValidQuery = true
    }
    return isValidQuery
  }
  
  public func getAlienNumeralFromSentence(inputString: String, romanNumerals: [String: Int]) -> (alienNumeral: String, alienValue: Int) {
    let words = inputString.componentsSeparatedByString(" ")
    var alienNumeral =  String()
    var alienValue = Int()
    
    if words.count == 3 {
      alienNumeral = words[0]
    }
    if let romanNumeral = words.last {
      if let retrievedAlienValue = romanNumerals[romanNumeral] {
        alienValue = retrievedAlienValue
      }
    }
    return (alienNumeral, alienValue)
  }
  
  //This function interprets a sentence of type .AlienGoodsValueInput
  //It returns a tuple: (alienGoods, alienGoodsValue)
  //Example IO: input: ("glob glob Silver is 34 Credits", ["glob": 1, "prok": 5])
  //           output: ("Silver", 34)
  public func getAlienGoodsFromSentence(sentence: String, alienNumeralDictionary: [String: Int])-> (alienGoods: String, alienGoodsValue: Int)? {
    let alienNumber = getAlienNumeralsFromSentence(sentence, alienNumeralDictionary: alienNumeralDictionary)
    let alienGoodsValue = getAlienNumberValue(alienNumber, alienNumeralDictionary: alienNumeralDictionary)
    if let alienGoods = getAlienGoodsFromSentence(sentence) {
      return (alienGoods, alienGoodsValue)
    }
    return nil
  }
  
  func handleAlienNumeralQuery() {
    
  }
  
  func handleAlienGoodsQuery() {
    
  }
  //This function scans an input sentence for alien Numerals that exist as keys in the alienNumeralDictionary
  //It returns any found numerals ordered in an array
  //Example IO: input: "glob glob silver is 34 Credits"
  //           output: ["glob", "glob"]
  public func getAlienNumeralsFromSentence(sentence: String, alienNumeralDictionary: [String: Int])-> [String] {
    let words = sentence.componentsSeparatedByString(" ")
    let alienNumeralKeys = [String](alienNumeralDictionary.keys)
    var alienNumerals = [String]()
    for word in words {
      if alienNumeralKeys.contains(word) {
        alienNumerals.append(word)
      }
    }
    return alienNumerals
  }
  
  //This function scans an input sentence for any word that can be cast to an Int.
  //It returns the first Int found, or nil if no Int is found
  public func getIntegerFromSentence(sentence: String) -> Int? {
    let words = sentence.componentsSeparatedByString(" ")
    for word in words {
      if let number = Int(word) {
        return number
      }
    }
    return nil
  }
  
  //This function reads an alienNumber and an associated alienNumeralDictionary
  //It returns alienNumber interpreted with the alienNumeralDictionary as a Roman Numeral
  //Example IO: input: (["prok", "glob", "glob"], ["glob": 1, "prok": 5])
  //            output: 7
  public func getAlienNumberValue(alienNumber: [String], alienNumeralDictionary: [String: Int]) -> Int {
    var alienValues = [Int]()
    for numeral in alienNumber {
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
  
  //This function reads a sentence of type: .AlienGoodsValueInput
  //It identifies and returns the alienGoods
  //Example IO: input: "glob glob Silver is 34 Credits"
  //           output: "Silver"
  func getAlienGoodsFromSentence(sentence: String) -> String? {
    let words = sentence.componentsSeparatedByString(" ")
    if words.contains("is") {
      if let indexOfTheWordIs = words.indexOf("is") {
        return words[indexOfTheWordIs - 1]
      }
    }
    return nil
  }
  
  
}
















import Foundation

public class MerchantsGuideInputHandler {
  
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
  
  public func retrieveAlienNumeralValue(inputString: String, romanNumerals: [String: Int]) -> (alienNumeral: String, alienValue: Int) {
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
  
  //This function parses a sentence of type .AlienGoodsValueInput
  //This sentence type has the form: "glob glob Silver is 34 Credits"
  //
  func retrieveAlienGoodsValue(sentence: String, alienNumeralDictionary: [String: Int])-> (alienGood: String, alienGoodValue: Int) {
    let alienNumeralPrice = getAlienNumeralsFromSentence(sentence, alienNumeralDictionary: alienNumeralDictionary)
    //TODO:

  }
  
  func handleAlienNumeralQuery() {
    
  }
  
  func handleAlienGoodsQuery() {
    
  }
  //This function scans an input sentence for alien Numerals that exist as keys in the alienNumeralDictionary
  //It returns any found numerals ordered in an array
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
  //Assumption: Only one or less possible Ints exist in the sentence
  public func getIntegerFromSentence(sentence: String) -> Int? {
    let words = sentence.componentsSeparatedByString(" ")
    for word in words {
      if let number = Int(word) {
        return number
      }
    }
    return nil
  }
  
  //This function reads an array of Alien Numerals a dictionary and returns the value
  //Example IO: input: (["prok", "glob", "glob"], ["glob": 1, "prok": 5])
  //            output: 7
  public func getAlienCompoundNumeralValue(alienNumerals: [String], alienNumeralDictionary: [String: Int]) -> Int {
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
  
  
  
  
}






  
  
  
  
  
  
  
  
  

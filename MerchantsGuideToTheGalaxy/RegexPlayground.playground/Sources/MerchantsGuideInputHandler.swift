import Foundation

public class MerchantsGuideInputHandler {
  
  let data = MerchantsGuideData()
  
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
  
  public func handleAlienNumeralValue(inputString: String) -> (alienNumeral: String, alienValue: Int) {
    let words = inputString.componentsSeparatedByString(" ")
    var alienNumeral =  String()
    var alienValue = Int()
    if words.count == 3 {
      alienNumeral = words[0]
    }
    if let romanNumeral = words.last {
      if let retrievedAlienValue = data.romanNumerals[romanNumeral] {
      alienValue = retrievedAlienValue
      }
    }
    return (alienNumeral, alienValue)
  }
  
  func handleAlienGoodsValue() {
    
  }
  
  func handleAlienNumeralQuery() {
    
  }
  
  func handleAlienGoodsQuery() {
    
  }
  
}
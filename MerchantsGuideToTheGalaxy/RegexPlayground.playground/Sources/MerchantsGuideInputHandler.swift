import Foundation

public class MerchantsGuideInputHandler {
  
  public init(){
    
  }
  
  public enum TypeOfUserStatement {
    case AlienNumeralValueInput
    case AlienGoodsValueInput
    case AlienNumeralQuery
    case AlienGoodsQuery
    case InvalidUserStatement
  }
  
  public func evaluateUserInputString(inputString: String, romanNumerals: [String: Int]) -> TypeOfUserStatement {
    if isAlienNumeralValue(inputString, romanNumerals: romanNumerals) {
      return .AlienNumeralValueInput
    } else if isAlienGoodsValue(inputString) {
      return .AlienGoodsValueInput
    } else if isAlienNumeralQuery(inputString) {
      return .AlienNumeralQuery
    } else if isAlienGoodsQuery(inputString) {
      return .AlienGoodsQuery
    }
    return .InvalidUserStatement
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
  
  public func handleAlienNumeralValue(inputString: String, romanNumerals: [String: Int]) -> (alienNumeral: String, alienValue: Int) {
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
  
  func handleAlienGoodsValue() {
    
  }
  
  func handleAlienNumeralQuery() {
    
  }
  
  func handleAlienGoodsQuery() {
    
  }
  
}
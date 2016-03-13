import Foundation


public class MerchantsGuideDictionarys {
  
  public init() {
    romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    alienNumerals = [String: Int]()
    alienGoods = [String: Int]()
  }
  
 public let romanNumerals: [String: Int]
 public var alienNumerals: [String: Int]
 public var alienGoods: [String: Int]

  public func setFromDictionaryKeys(inputDictionary: [String: Int]) -> Set<String> {
    let dictionaryKeys = [String](inputDictionary.keys)
    let setOfKeys = arrayToSet(dictionaryKeys)
    return setOfKeys
  }
  
func arrayToSet(inputArray: [String]) -> Set<String> {
    var outputSet = Set<String>()
    for element in inputArray {
      outputSet.insert(element)
    }
    return outputSet
  }
  
}
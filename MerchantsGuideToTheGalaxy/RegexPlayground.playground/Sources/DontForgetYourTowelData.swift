import Foundation

public func doubleTheNumber (i: Int) -> Int {
  return (i * 2)
}

public class DontForgetYourTowelData {
  
  public init() {
    romanNumerals = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    alienNumerals = [String: Int]()
    alienGoods = [String: Int]()
  }
  
 public var romanNumerals: [String: Int]
 public var alienNumerals: [String: Int]
 public var alienGoods: [String: Int]
  public var alienNumeralsSet: Set[String: Int]
  
  
}
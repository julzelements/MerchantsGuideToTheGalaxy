//: Playground - noun: a place where people can play

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





class AlienGoods {
  var alienNumeralsDictionary: AlienNumerals
  var goodsDictionary = [String: Int]()
  
  init(alienNumerals: AlienNumerals) {
    self.alienNumeralsDictionary = alienNumerals
  }
  
  var knownGoods : [String] {
    return Array(goodsDictionary.keys)
  }
  
  //This function interprets a sentence of type .AlienGoodsValueInput
  //It writes the key:value pair to the goodsDictionary in the class instance
  //
  //Example IO: input: ("glob glob Silver is 68 Credits", ["glob": 1, "prok": 5])
  //           output: goodsDictionary[Silver] = 34
  func parseStatement(statement: String) {
    let words = statement.componentsSeparatedByString(" ")
    var credits = Int()
    var goodsValue = Int()
    var alienGood = String()

    //Search statement for Int
    for word in words {
      if let number = Int(word) {
        credits = number
      }
    }

    //AlienGood is on LHS of word "is"
    if words.contains("is") {
      if let indexOfTheWordIs = words.indexOf("is") {
        alienGood = words[indexOfTheWordIs - 1]
      }
    }

    //Create array of all the alienNumerals in the statement
    if let alienNumber = alienNumeralsDictionary.getArrayOfAlienNumerals(statement) {
      goodsValue = alienNumeralsDictionary.readNumber(alienNumber)!
    }

//    Write the calculated goods value to the goodsDictionary
    if credits != 0 {
      goodsDictionary[alienGood] = (credits / goodsValue)
    }
  }
  
  
  
  //This function interprets a sentence of type .AlienGoodsQuery
  //It returns a tuple containing: alienNumber (String), alienGoods (String), value of Goods (Int)
  //
  //Example IO: input: ("how many Credits is glob prok Iron", ["glob": 1, "prok": 5], ["Iron": 20])
  //           output: ("glob prok", "Iron", 782)
  func parseQuery(query: String) -> (quantity: String, alienGood: String, price: Int) {
    var quantityInAlien = String()
    var alienGood = String()
    var price = Int()
    
    let words = query.componentsSeparatedByString(" ")
    
    for word in words {
      if knownGoods.contains(word) {
        alienGood = word
      }
    }
    
    if let alienNumerals = alienNumeralsDictionary.getArrayOfAlienNumerals(query) {
      if let quantity = alienNumeralsDictionary.readNumber(alienNumerals) {
        if let unitPrice = goodsDictionary[alienGood] {
          price = unitPrice * quantity
          quantityInAlien = alienNumerals.joinWithSeparator(" ")
        }
      }
    }
    return (quantityInAlien, alienGood, price)
  }
  
}






  





let testInput = "glob is I\nprok is V\npish is X\ntegj is L\nglob glob Silver is 34 Credits\nglob prok Gold is 57800 Credits\npish pish Iron is 3910 Credits\nhow much is pish tegj glob glob ?\nhow many Credits is glob prok Silver ?\nhow many Credits is glob prok Gold ?\nhow many Credits is glob prok Iron ?\nhow much wood could a woodchuck chuck if a woodchuck could chuck wood ?"

let testArray = testInput.componentsSeparatedByString("\n")

//let testAlienDictionary = ["glob": 1, "prok": 5, "pish": 10, "tegj": 50]

let testAlienNumerals = AlienNumerals()
//fill AlienNumerals
for statement in testArray {
  testAlienNumerals.parseStatement(statement)
}

//Initialize Goods
let testGoodsDictionary = AlienGoods(alienNumerals: testAlienNumerals)

for statement in testArray {
  testArray
}

for statement in testArray {
  testGoodsDictionary.parseStatement(statement)
  let query = testGoodsDictionary.parseQuery(statement)
  print("\(query.quantity) \(query.alienGood) is \(query.price) Credits")
}

print(testGoodsDictionary.goodsDictionary)





//: Playground - noun: a place where people can play
//Assumption: User will NOT supply compound numerals. Eg: blug is IV.
//RN and RNs refers to Roman Numeral and Roman Numerals respectively
import UIKit

let RNValues: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

//This is just all the numerals (no values)
let RNs = [String](RNValues.keys)

let RNTheNumberOne = "I"
let RNTheNumberFour = "IV"
let RNNineteenFourtyFour = "MCMXLIV"

//This function checks the input for the presence of a single digit Roman Numeral
//"IV" would return false, "V" would return true
func checkSentenceForRNs(sentence: String) -> Bool {
  var sentenceHasRN = false
  //Split up "sentence" by whitespace and add to array: "words"
  let words = sentence.componentsSeparatedByString(" ")
  for word in words {
    if RNs.contains(word) {
      sentenceHasRN = true
    }
  }
  return sentenceHasRN
}


func splitWordToArrayOfCharactersOfTypeString(word: String) -> [String] {
//input: "IVDFB"
//output: ["I", "V", "D", "F", "B"]
//Note that the characters are returned as type: String 
  
  var arrayOfCharacters = [String]()
  for character in word.characters {
    arrayOfCharacters.append(String(character))
  }
  return arrayOfCharacters
}

func rNDigitsToValues(RNDigitsArray: [String]) -> [Int] {
  //input: ["I", "V", "C"]
  //output: [1, 5, 100]
  var RNValuesArray = [Int]()
  for RNIndex in RNDigitsArray {
    if let RNValue = RNValues[RNIndex] {
      RNValuesArray.append(RNValue)
    }
  }
  return RNValuesArray
}

rNDigitsToValues(["C", "V"])



func rNtoValue(RN: String) -> Int {
  var totalRNValueReturned = 0
  //The ouput from .reverse() needs to be cast to an Array object
  let reversedRNArray = Array(splitWordToArrayOfCharactersOfTypeString(RN).reverse())
  let reversedRNArrayValues = rNDigitsToValues(reversedRNArray)
 
  totalRNValueReturned += reversedRNArrayValues[0]
  
  
  for j in 1..<reversedRNArrayValues.count {
    let i = j - 1
    if reversedRNArrayValues[i] <= reversedRNArrayValues[j] {
      totalRNValueReturned += reversedRNArrayValues[j]
    } else if reversedRNArrayValues[i] > reversedRNArrayValues[j] {
      totalRNValueReturned -= reversedRNArrayValues[j]
    }
  }
  return totalRNValueReturned
}


// Tests ------ Tests ------ Tests ------ Tests ------ Tests ------ Tests ------ Tests

//checkForRNs
checkSentenceForRNs("glob is I") == true ? print("test works") : print("test fails")
checkSentenceForRNs("glob glob Silver is 34 Credits") == false ? print("test works") : print("test fails")

//RNtoValue
rNtoValue(RNTheNumberOne) == 1 ? print("test works") : print("test fails")
rNtoValue(RNTheNumberFour) == 4 ? print("test works") : print("test fails")
rNtoValue(RNNineteenFourtyFour) == 1944 ? print("test works") : print("test fails")

//convertDigitsArrayToValuesArray
rNDigitsToValues(["I", "V", "C"]) == [1, 5, 100] ? print("test works") : print("test fails")

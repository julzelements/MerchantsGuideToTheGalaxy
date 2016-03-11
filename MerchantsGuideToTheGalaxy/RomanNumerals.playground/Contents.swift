//: Playground - noun: a place where people can play
//Assumption: User will NOT supply compound numerals. Eg: blug is IV.
//RN and RNs refers to Roman Numeral and Roman Numerals respectively
import UIKit

let RNValues: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

//This is just all the numerals (no values)
let RNs = [String](RNValues.keys)

let RNTheNumberOne = "I"
let RNTheNumberFour = "IV"
let RNNineteenHundredAndThree = "MCMXLIV"



func stringToArray(inputString: String) -> Array<String> {
 return inputString.componentsSeparatedByString(" ")
}

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

func convertArrayCharactersToStrings(arrayOfCharacters: [Character]) -> [String] {
  var arrayOfStrings = [String]()
  for character in arrayOfCharacters {
    
    arrayOfStrings.append(String(character))
  }
  return arrayOfStrings
}

func testCharacterArray() -> [Character] {
let testCharacterArray = [Character]()
for character in "VICVM" {
  testCharacterArray.append(character)
}
}
func RNtoValue(RN: String) -> Int {
  var totalRNValueReturned = 0
  let RNArray = [""]
let reversedRNArray = RNArray.reverse()
  for numeral in reversedRNArray {
    if let value = RNValues[numeral] {
      print(value)
      totalRNValueReturned += value
    }
  }

return totalRNValueReturned
}

RNtoValue("MVMIX")


let testIV = ["I", "V"]

if testIV[0] < testIV[1] {
  if let i = RNValues[testIV[0]] {
    if let j = RNValues[testIV[1]] {
      print(j - i)
    }
  }
}


let testVI = ["V", "I"]

if testVI[0] > testVI[1] {
  if let i = RNValues[testVI[0]] {
    if let j = RNValues[testVI[1]] {
      print(i + j)
    }
  }
}









// Tests ------ Tests ------ Tests ------ Tests ------ Tests ------ Tests ------ Tests

//stringToArrayTest
stringToArray("glob is I") == ["glob", "is", "I"] ? print("test works") : print("test fails")

//checkForRNs
checkSentenceForRNs("glob is I") == true ? print("test works") : print("test fails")
checkSentenceForRNs("glob glob Silver is 34 Credits") == false ? print("test works") : print("test fails")

//RNtoValue
RNtoValue(RNTheNumberOne) == 1 ? print("test works") : print("test fails")
RNtoValue(RNTheNumberFour) == 4 ? print("test works") : print("test fails")
RNtoValue(RNNineteenHundredAndThree) == 1903 ? print("test works") : print("test fails")
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var empty: String? = ""
var newString = "something"
var errorString = String()

if let newString = empty {
  print("do awesome code")
} else {
  errorString = errorString + "error1"
}

if let newString = empty {
  print("do awesome code")
} else {
  errorString = errorString + "Error 2"
}


print(errorString)


let a: Double = 5
let b: Int = 2

a/Double(b)

3910.0/20.0

let testdouble: Double = 2.0
let testdecimal: Double = 2.5


func truncateTrailingZeros(number: Double) -> String {
  if number % 1 == 0 {
    return String(Int(number))
  }
return String(number)
}

truncateTrailingZeros(testdouble)
truncateTrailingZeros(testdecimal)

2.5 % 2
6.0 % 1

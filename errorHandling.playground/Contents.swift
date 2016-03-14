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





//
//  main.swift
//  NumberSystemConverter
//
//  Created by Yeseo Kim on 2021-01-26.
//

import Foundation

//INPUT
//Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H):", terminator: "") //Keep following output on the same line
var fromNS = readLine()!

//Switch fromNS into number forms
switch fromNS {
case "B":
     fromNS = "2"
case "O":
     fromNS = "8"
case "D":
     fromNS = "10"
case "H":
     fromNS = "16"
default:
    break
}

//Get the "from" number
print("What number do you want to convert from?")
print("Enter your choice:", terminator: "")
let fromN = readLine()!

//Get the "to" number system
print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H):", terminator: "")
var toNS = readLine()!

//Switch toNS into number forms
switch toNS {
case "B":
     toNS = "2"
case "O":
     toNS = "8"
case "D":
     toNS = "10"
case "H":
     toNS = "16"
default:
    break
}

//PROCESS
//Binary, Octal, or Hexadecimal to Decimal
func getDecimal(of valueBaseN: String, inBase base: String) -> Double {
    var exponentN = 0.0
    var decimalOutput = 0.0
    for character in valueBaseN.reversed() {
        var digit = String(character)
        if base == "16" {
            switch digit {
            case "A":
                digit = "10"
            case "B":
                digit = "11"
            case "c":
                digit = "12"
            case "D":
                digit = "13"
            case "E":
                digit = "14"
            case "F":
                digit = "15"
            default:
                break
            }
        }
        if let digit = Double(digit) {
            decimalOutput += digit * pow(Double(base)!, exponentN)
            exponentN += 1
        }
    }
    return decimalOutput
}
//Decimal to Binary, Octal, or Hexadecimal
func getRepresentation(of valueToConvert: Int, inBase base: String) -> String {
    var valueLeftToConvert = valueToConvert
    
    var representation = ""
    
    while valueLeftToConvert > 0 {
        let nextDigit = valueLeftToConvert % Int(base)!
        
        representation = String(nextDigit) + representation
        
        valueLeftToConvert = valueLeftToConvert / Int(base)!
        
    }
    
    return representation
    
}

// OUTPUT
var outputBaseT: Double
var outputBaseN: String

//non-decimal to decimal
if toNS == "10" {
    outputBaseT = getDecimal(of: fromN, inBase: fromNS)
    print("The converted value is: \(outputBaseT)")
//decimal to non-decimal
} else if fromNS == "10" {
    outputBaseN = getRepresentation(of: Int(fromN)!, inBase: toNS)
    print("The converted value is: \(outputBaseN)")
//non-decimal to non-decimal
} else {
    let decimalValue = getDecimal(of: fromN, inBase: fromNS)
    outputBaseN = getRepresentation(of: Int(decimalValue), inBase: toNS)
    print("The converted value is: \(outputBaseN)")
}

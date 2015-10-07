//
//  main.swift
//  Calculator
//
//  Created by iGuest on 10/7/15.
//  Copyright (c) 2015 Jia Yu. All rights reserved.
//

import Foundation


println("Enter an expression separated by returns:")

func input() -> String {
    
    let standardInput = NSFileHandle.fileHandleWithStandardInput()
    
    let inputData = standardInput.availableData
    
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

var inputStr = input()

var result = 0

if inputStr.rangeOfString(" ") == nil {
    
    var number1 = convert(inputStr)
    
    var exp = input()
    
    var number2 = convert(input())
    
    switch exp {
        
    case "add", "+":
        
        result = number1 + number2
        
    case "sub", "-":
        
        result = number1 - number2
        
    case "mul", "*":
        
        result = number1 * number2
        
    case "div", "/":
        
        result = number1 / number2
        
    case "mod":
        
        result = number1 % number2
        
    default:
        println("What's the expression?")
    }
    
} else {
    
    var myStringArr = inputStr.componentsSeparatedByString(" ")

    var exp = myStringArr[myStringArr.count - 1]

    switch exp {
        
        case "count":
        
            result = myStringArr.count - 1
        
        case "avg":
        
            for index in 0...myStringArr.count - 2 {
                
                result = result + convert(myStringArr[index])
                
        }
            
            result = result / (myStringArr.count - 1)
        
        case "fact":
        
    default:
        
        println("What's the expression?")
    }
    
}

println("Result:" + String(result))












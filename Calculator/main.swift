//
//  main.swift
//  Calculator
//
//  Created by Jia Yu on 10/7/15.
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

func convertInt(incoming:String) -> Int {
    
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
    
}

func convertDouble(incoming:String) -> Double {
    
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    
}

var inputStr = input()

if inputStr.rangeOfString(" ") == nil {
    
    var number1 = convertDouble(inputStr)
    
    var exp = input()
    
    var number2 = convertDouble(input())
    
    var result = 0.0
    
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
    
    println("Result:" + String(stringInterpolationSegment: result))
    
} else {
    
    var myStringArr = inputStr.componentsSeparatedByString(" ")

    var exp = myStringArr[myStringArr.count - 1]
    
    var result1 = 0

    switch exp {
        
        case "count":
        
            result1 = myStringArr.count - 1
        
        case "avg":
        
            for index in 0...myStringArr.count - 2 {
                
                result1 = result1 + convertInt(myStringArr[index])
                
            }
            
            result1 = result1 / (myStringArr.count - 1)
        
        case "fact":
        
            if myStringArr.count > 2 {
                
                println("Please enter one integer for fact")
                
            } else {
                
                result1 = 1
                
                for index in 1...convertInt(myStringArr[0]) {
                    
                    result1 = result1 * index
                    
                    println(result1)
                    
                }
                
            }
        
        default:
        
            println("What's the expression?")
    }
    
    println("Result:" + String(result1))
}














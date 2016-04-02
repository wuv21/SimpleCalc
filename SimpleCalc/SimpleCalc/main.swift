//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 4/2/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//

import Foundation

print("Welcome to SimpleCalc.\nPlease enter expressions and press return after each one.")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

var marker = false;
var nums: [Int] = [];

while !marker {
    var userInput = input()
    
    switch userInput {
        case "add", "sub", "mul", "div", "mod":
            print("here")
            marker = true
        
        default:
            let num:Int? = Int(input())
            nums.append(num!)
    }
    
    print(nums)
}

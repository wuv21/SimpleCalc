//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 4/2/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//
//  Uses command-line arguments (extra credit option) for a simple calculator.
//  Supports negative and decimal numbers as input.

import Foundation

// input method (from class powerpoint)
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

print("Welcome to SimpleCalc.\nPlease enter expressions and press return after each one.")

// a run of SimpleCalc
var count = 0;
var nums: [Double] = [];
while count <= nums.count {
    var userInput = input()
    
    switch userInput {
        case "add", "sub":
            var sign = 1.0;
            if userInput == "sub" {
                sign = -1.0;
            }
            
            var sum = 0.0
            for n in nums {
                sum = sum + n * sign;
            }
        
            print(sum)
        
        case "mul":
            var prod = 1.0
            for n in nums {
                prod = prod * n;
            }
        
            print(prod)
        
        case "div":
            var quot = Double(nums[0])
            for index in 1...nums.count - 1 {
                quot = quot / Double(nums[index]);
            }
        
            print(quot)
        
        case "count":
            print(nums.count)
        
        case "average":
            var sum = 0.0
            for n in nums {
                sum = sum + n;
            }
        
            print(sum / Double(nums.count))
        
        case "fact":
            if nums.count != 1 {
                print("Can only accept one input")
                break
            } else if nums[0] < 0 || floor(nums[0]) != nums[0] {
                print("Number must be a positive integer")
                break
            }
        
            var result = 1
            for index in 1...Int(nums[0]) {
                result = result * index
            }
        
            print(result)
        
        default:
            let num:Double? = Double(userInput)
            nums.append(num!)
    }
    
    count = count + 1
}

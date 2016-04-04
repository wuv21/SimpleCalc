//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 4/2/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//
//  Uses only command-line arguments (extra credit option) for a simple calculator.
//  Supports negative and decimal numbers as input.

//  Basic operations: add (addition or sum), sub (substraction), mul (multiplication), div (division)
//  Extended operations: count (counts number of inputs), average (average of inputs), fact (factorial of input)

//  Example: swift main.swift 1 2 3 add
//  Output: => 6

import Foundation

// input method (from class powerpoint)
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

var nums: [Double] = [];
if (Process.arguments.count <= 2) {
    print("No arguments or not enough arguments detected")
    exit(0)
}

for i in 1...Process.arguments.count - 2 {
    let num:Double? = Double(Process.arguments[i])
    nums.append(num!)
}

let keyword = Process.arguments[Process.arguments.count - 1]

switch keyword {
    case "add", "sub":
        var sign = 1.0;
        if keyword == "sub" {
            sign = -1.0;
        }
        
        var sum = nums[0]
        for i in 1...nums.count - 1 {
            sum = sum + nums[i] * sign;
        }

        print(sum)

    case "mul":
        var prod = 1.0
        for n in nums {
            prod = prod * n;
        }

        print(prod)

    case "div":
        if nums.count == 1 {
            print("Only one number input required. At least 2 needed for division");
            
        } else {
            var quot = Double(nums[0])
            for index in 1...nums.count - 1 {
                quot = quot / Double(nums[index]);
            }
            
            print(quot)
        }

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
        print("Keyword operation not recognized")
}

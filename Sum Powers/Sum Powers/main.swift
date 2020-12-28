//
//  main.swift
//  Sum Powers
//
//  Created by Vincent Snow on 12/28/20.
//

import Foundation

var sum = 0
for i in 1...1000 {
    sum+=itself(x: i)
    print(sum)
}
print(String(sum).suffix(10))

func power(num:Int, powerOf:Int) -> Int {
    var x = num
    if num == 1 {
        return 1
    }
    for _ in 1...powerOf-1 {
        x*=num
        if String(x).count > 11 {
            let stringX = String(x).suffix(11)
            x = Int(stringX)!
        }
    }
    return x
}

func itself(x:Int) -> Int {
    return power(num: x, powerOf: x)
}

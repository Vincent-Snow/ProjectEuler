//
//  main.swift
//  1000 digit fibonacci
//
//  Created by Vincent Snow on 12/29/20.
//

import Foundation
extension Double {

    func toString(decimal: Int = 9) -> String {
        let value = decimal < 0 ? 0 : decimal
        var string = String(format: "%.\(value)f", self)

        while string.last == "0" || string.last == "." {
            if string.last == "." { string = String(string.dropLast()); break}
            string = String(string.dropLast())
        }
        return string
    }
}


var fib: [String] = []
var x = 1.0
var y = 1.0
var counter = -1
var countHolder = 0
var inARow = 0
fib.append(x.toString())
fib.append(y.toString())
for _ in 1...737 {
    //print(x, y)
    x = x + y
    y = x + y
    fib.append(x.toString())
    fib.append(y.toString())
}
//print(fib)
for i in fib {
    print(i)
}
var letsSee: [Int] = []
countHolder = String(fib[0]).count
for i in 0...fib.count-1 {
    let x = String(fib[i]).count
    //print(x)
    if countHolder == x {
        counter+=1
    } else {

        if counter == 5 {
            inARow+=1
        } else {
            //print(inARow)
            letsSee.append(inARow)
            inARow = 0
        }
        print(String(fib[i-1]).count, counter)
        countHolder = x
        counter = 1
    }
}
print(fib.last!.count, fib.count)
var t = 0
for x in letsSee {
    t += (x*5)
    t += 4
}
print(t)

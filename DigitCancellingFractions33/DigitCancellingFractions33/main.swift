//
//  main.swift
//  DigitCancellingFractions33
//
//  Created by Vincent Snow on 12/11/21.
//
//The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
//
//We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
//
//There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
//
//If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

import Foundation

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
func reduceFraction(_ x: Int,_ y: Int) -> (Int, Int){
    var d = 0;
    d = gcd(x, y);
    return (x/d,y/d)
}
func gcd(_ a: Int,_ b: Int) -> Int {
    if (b == 0) {
        return a
    }
    return gcd(b, a % b);
}

var c = 0
var ans = (1,1)
var arr:[(Int,Int,Int,Int)] = []
denLoop: for den in 11...99 {
    numLoop: for num in 10..<den {
        if num % 10 == den / 10 {
            let num1 = num / 10
            let den1 = den % 10
            if (num1 > den1) {
                continue numLoop
            }
            if Double(num) / Double(den) == Double(num1) / Double(den1) {
                let tup = reduceFraction(num1, den1)
                arr.append((tup.0,tup.1,num,den))
                c+=1
            }
        }
    }
}

for i in arr {
    print(i)
    ans = (ans.0 * i.0, ans.1 * i.1)
}
print(reduceFraction(ans.0, ans.1))
print(c,t())

// 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 2/3 2/5 2/7 2/9 3/4 3/5 3/7 3/8 4/5 4/7 4/9 5/6 5/7 5/8 5/9 6/7 7/8 7/9 8/9

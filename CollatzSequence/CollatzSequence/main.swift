//
//  main.swift
//  CollatzSequence
//
//  Created by Vincent Snow on 12/22/20.
//

import Foundation

var counter = 0
var highest = (0,0)
for i in 1...1000000 {
    var x = i
    counter = 0
    while x != 1 {
        if x % 2 == 0 {
            x/=2
        } else {
            x = (3*x)+1
        }
        counter+=1
    }
    if counter > highest.1 {
        highest = (i, counter)
        print(highest)
    }
}


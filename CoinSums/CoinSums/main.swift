//
//  main.swift
//  CoinSums
//
//  Created by Vincent Snow on 3/9/21.
//
/*In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
 
 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
 It is possible to make £2 in the following way:

 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 How many different ways can £2 be made using any number of coins?*/

import Foundation

let one = 1
let two = 2
let five = 5
let ten = 10
let twenty = 20
let fifty = 50
let pound = 100
let twoPound = 200
var ans = 0
// There are 99 ways to make 2 pounds via 1 and 2 pence combined. 39 ways with 1 and 5 pence. 19 ways with 2 and 5 pence. 98 + 8 for each individual coin

//
//  main.swift
//  CombinatoricSelections53
//
//  Created by Vincent Snow on 5/5/22.
//

import Foundation
func quickBinomialCoefficient(_ n: Int, choose k: Int) -> Int {
  var result = 1

  for i in 0..<k {
    result *= (n - i)
    result /= (i + 1)
  }
  return result
}
var counter = 0
iLoop: for i in 2...100 {
        let u = i/2
    for j in 1...u {
        let comb = quickBinomialCoefficient(i, choose: j)
        if comb > 1000000 {
            
            if i % 2 != 0 {
                counter += (u-j+1)*2
            } else {
                counter += (u-j) * 2 + 1
            }
            
            print(quickBinomialCoefficient(i, choose: j),i,j,counter)
            continue iLoop
        }

    }
}
print(counter)

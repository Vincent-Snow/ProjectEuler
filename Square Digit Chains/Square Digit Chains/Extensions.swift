//
//  Extensions.swift
//  Square Digit Chains
//
//  Created by Vincent Snow on 12/26/20.
//

import Foundation

func factorial(_ a: Int) -> Int {
    let n = a
    if(n == 1){
      return 1
    }else{
        return n*factorial(n-1)
    }
}

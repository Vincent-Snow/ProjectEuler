//
//  main.swift
//  Coin Partitions
//
//  Created by Vincent Snow on 1/13/21.
//

import Foundation

let x = [1,1,1,1,1]
var num = 8
var counter = 0
while num == 8 {
    
}
// 1,2,3,5,7,11,15,22,30
// 0,1,2,2,4,4 ,7 ,7 ,12
// 1

// 1 1             1 1 1 1 1 1 1 1      1 1 1 1 1 1 1       1 1 1 1 1 1 1 1 1
// 11              11 1 1 1 1 1 1       11 1 1 1 1 1        11 1 1 1 1 1 1 1
//                 11 11 1 1 1 1        11 11 1 1 1         11 11 1 1 1 1 1
// 1 1 1           11 11 11 1 1         11 11 11 1          11 11 11 1 1 1
// 11 1            11 11 11 11          111 1 1 1 1         11 11 11 11 1
// 111             111 1 1 1 1 1        111 11 1 1          111 1 1 1 1 1 1
//                 111 11 1 1 1         111 11 11           111 11 1 1 1 1
// 1 1 1 1         111 11 11 1          111 111 1           111 11 11 1 1
// 11 1 1          111 111 1 1          1111 1 1 1          111 11 11 11
// 11 11           111 111 11           1111 11 1           111 111 1 1 1
// 111 1           1111 1 1 1 1         1111 111            111 111 11 1
// 1111            1111 11 1 1          11111 1 1           111 111 111
//                 1111 11 11           11111 11            1111 1 1 1 1 1
// 1 1 1 1 1       1111 111 1           111111 1            1111 11 1 1 1
// 11 1 1 1        1111 1111            1111111             1111 11 11 1
// 11 11 1         11111 1 1 1                              1111 111 1 1
// 111 1 1         11111 11 1                               1111 111 11
// 111 11          11111 111                                1111 1111 1
// 1111 1          111111 1 1                               11111 1 1 1 1
// 11111           111111 11                                11111 11 1 1
//                 1111111 1                                11111 11 11
// 1 1 1 1 1 1     11111111                                 11111 111 1
// 11 1 1 1 1                                               11111 1111
// 11 11 1 1                                                111111 1 1 1
// 11 11 11                                                 111111 11 1
// 111 1 1 1                                                111111 111
// 111 11 1                                                 1111111 1 1
// 111 111                                                  1111111 11
// 1111 1 1                                                 11111111 1
// 1111 11                                                  111111111
// 11111 1
// 111111
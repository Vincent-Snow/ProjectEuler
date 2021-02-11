//
//  main.swift
//  Largest Exponential
//
//  Created by Vincent Snow on 2/10/21.
//

import Foundation

print(pow(2, 11), 2*11,2+11, 2,11)
print(pow(3, 7), 3*7,3+7, 3,7)
var pAr: [Double:(Int,Int)] = [:]

func pComp(_ x:Int, _ y:Int) {
    print(pow(Double(x), Double(y)),("prod",x*y),("sum",x+y),("diff",abs(x-y)),x,y)
}
pComp(2, 13)
pComp(13, 3)
for i in 1...30 {
    for j in 1...12 {
        pAr[pow(Double(i), Double(j))] = (i,j)
        //pComp(j, i)
    }
}

//for i in pAr.sorted(by: {$0.key<$1.key}){
//    print(i.key,i.value)
//}

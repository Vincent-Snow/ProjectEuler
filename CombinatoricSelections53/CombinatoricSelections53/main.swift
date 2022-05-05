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
//var nCr: [(Int,Int)] = []
//func eratosthenesSieve(to n: Int) -> [Int] {
//    var composite = Array(repeating: false, count: n + 1) // The sieve
//    var primes: [Int] = []
//
//    if n >= 150 {
//        let d = Double(n)
//        let upperBound = Int(d / (log(d) - 4))
//        primes.reserveCapacity(upperBound)
//    } else {
//        primes.reserveCapacity(n)
//    }
//
//    let squareRootN = Int(Double(n).squareRoot())
//    var p = 2
//    while p <= squareRootN {
//        if !composite[p] {
//            primes.append(p)
//            for q in stride(from: p * p, through: n, by: p) {
//                composite[q] = true
//            }
//        }
//        p += 1
//    }
//    while p <= n {
//        if !composite[p] {
//            primes.append(p)
//        }
//        p += 1
//    }
//    return primes
//}
//var sieveDict: [Int:Bool] = [:]
//for i in eratosthenesSieve(to: 100) {
//    sieveDict[i] = true
//}
//
//func nCr(n: Int, r: Int) -> Int {
//    if r == 0 || r == n {
//        return 1
//    }
//    if r == 1 || r == n-1 {
//        return n
//    }
//    for i in 1...n {
//
//    }
//
//    return 0
//}
//func arrMaker(n:Int)-> Set<Int> {
//    var nArr: Set<Int> = []
//    if n == 1 {
//        return []
//    }
//    for i in 2...n {
//        nArr.insert(i)
//    }
//    return nArr
//}
//
//for i in 1...15 {
//    let u: Int
//    if i % 2 == 0 {
//        u = i/2
//    } else {
//        u = i/2 + 1
//    }
//    for j in 1...u where j != i {
//        var n = arrMaker(n: i)
//        let r = arrMaker(n: j)
//        var nMinusr = arrMaker(n: i-j)
//        n.subtract(r)
//        let inter = n.intersection(nMinusr)
//        n.subtract(nMinusr)
//        nMinusr.subtract(inter)
//        print(n, nMinusr,i,j)
////        while nMinusr.count > 0 {
//        var nArr = Array(n)
//
//            for x in nMinusr {
//                for y in 0...nArr.count-1 {
//                    if nArr[y] % x == 0 {
//
////                        if nArr[y] != x {
////                            if nArr.contains(nArr[y]/x) {
////
////                            }
//                        nArr.append(nArr[y]/x)
////                        }
//                        nArr[y] = 1
//                    }
//                    nMinusr.remove(x)
//                }
//
//            }
////        }
//        let prod = nArr.reduce(1, *)
////        if prod > 1000000 {
//            print(nArr,prod, i,j)
////        }
//    }
//
//}
//

//
//  main.swift
//  PrimePairSets
//
//  Created by Vincent Snow on 2/4/21.
//
/*The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
 
 Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.*/
import Foundation
import Algorithms

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
func eratosthenesSieve(to n: Int) -> [Int] {
    
    var composite = Array(repeating: false, count: n + 1) // The sieve
    var primes: [Int] = []
    
    if n >= 150 {
        let d = Double(n)
        let upperBound = Int(d / (log(d) - 4))
        primes.reserveCapacity(upperBound)
    } else {
        primes.reserveCapacity(n)
    }

    let squareRootN = Int(Double(n).squareRoot())
    var p = 2
    while p <= squareRootN {
        if !composite[p] {
            primes.append(p)
            for q in stride(from: p * p, through: n, by: p) {
                composite[q] = true
            }
        }
        p += 1
    }
    while p <= n {
        if !composite[p] {
            primes.append(p)
        }
        p += 1
    }
    return primes
}


var sieve: [Int] = []
var sieveDict:[Int:Bool] = [:]
var primeDict:[Int:Set<Int>] = [:]
for i in eratosthenesSieve(to: 100000000) {
    sieveDict[i] = true
    if i < 10000 && i != 5 && i != 2 {
        sieve.append(i)
    }
}


for i in sieve.combinations(ofCount: 2) {
    let s1 = String(i[0])
    let s2 = String(i[1])
    let int1 = Int(s1+s2)!
    let int2 = Int(s2+s1)!
    if sieveDict[int1] == true && sieveDict[int2] == true {
        //print(s1,s2)
        if primeDict[i[0]] != nil {
            var ar = primeDict[i[0]]!
            ar.insert(i[1])
            primeDict[i[0]] = ar
        } else {
            primeDict[i[0]] = [i[1]]
        }
    }
}
for i in primeDict.sorted(by: {$0.key < $1.key}) {
    //print("\n", i.key,i.value.sorted(by: {$0 < $1}))
    for j in i.value.sorted(by: {$0 < $1}) {
        if primeDict[j] != nil {
            let ar = primeDict[j]!
            let inter = i.value.intersection(ar)//.sorted(by: {$0 < $1})
            //print(j,inter)
            for k in inter {
                if primeDict[k] != nil {
                    let ar2 = primeDict[k]!
                    let tmpInter = ar.intersection(ar2)
                    let inter2 = i.value.intersection(tmpInter)
//                    if inter2.count != 0 {
//                        print("k: ", i.key, j, k, inter2)
//                    }
                    for l in inter2 {
                        if primeDict[l] != nil {
                            let ar3 = primeDict[l]!
                            let tmpInter2 = ar2.intersection(ar3)
                            let tmpInter3 = tmpInter2.intersection(ar)
                            let inter3 = tmpInter3.intersection(i.value)
                            if inter3.count != 0 {
                                print(i.key, j, k, l, inter3)
                            }
                        }
                    }
                }
            }
        }
    }
}

//func primeTest(_ n: Int,_ sieve: [Int]) -> (Int, Int) {
//
//    for i in sieve where i < n/2 {
//
//        if n.isMultiple(of: i) {
//            return (n, i)
//        }
//    }
//    return (n,1)
//}
//
//
//let arrayofarrays = [[467, 587, 617, 6323, 9473], [3, 17, 449, 2069, 6599], [3, 17, 449, 2069, 6353], [3, 17, 449, 6599, 6353], [3,37,67,5923,2377], [7,19,97,3727,4507], [31, 1123, 2029,5281, 2281], [17, 2741, 3917,6899, 4649], [89, 431, 983,13043, 11489], [13, 5197, 5701, 6733,8389]]
//aLoop: for arrayofnums in arrayofarrays {
//iLoop: for i in arrayofnums.combinations(ofCount: 2) {
//        let int1 = Int(String(i[0])+String(i[1]))!
//        let int2 = Int(String(i[1])+String(i[0]))!
//        if primeTest(int1, sieve).1 == 1 {
//            print(int1)
//        } else {
//            print("Stop!")
//            continue aLoop
//        }
//
//        if primeTest(int2, sieve).1 == 1 {
//            print(int2)
//        } else {
//            print("Stop!")
//            continue aLoop
//        }
//
//    }
//    print("does it ever get here")
//}
print(t())

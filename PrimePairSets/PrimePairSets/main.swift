//
//  main.swift
//  PrimePairSets
//
//  Created by Vincent Snow on 2/4/21.
//
/*The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
 
 Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.*/
import Foundation

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
var priConcat: [(Int,Int)] = []
var priDict: [Int:Set<Int>] = [:]
for i in eratosthenesSieve(to: 1000000) {
    sieveDict[i] = true
    if i < 5000 {
        sieve.append(i)
    }
}
print(sieve.count)
for i in 0..<sieve.count-1  {
    for j in 0..<sieve.count-1  {
        let a = Int(String(sieve[i]) + String(sieve[j]))!
        let b = Int(String(sieve[j]) + String(sieve[i]))!
        if sieveDict[a] == true && sieveDict[b] == true {
            //priConcat.append((sieve[i],sieve[j]))
            if priDict[sieve[i]] == nil {
                priDict[sieve[i]] = [sieve[j]]
            } else {
                priDict[sieve[i]]?.insert(sieve[j])
            }
        }
    }
}
//for i in priConcat {
//    print(i)
//}
var final:Set<Int> = []
var inter = priDict[19]!.intersection(priDict[7]!)
//inter.insert(3); inter.insert(7);
print(inter)
for i in inter {
    let inter2 = inter.intersection(priDict[i]!)
    if inter2 != [] {
        for j in inter2 {
            final.insert(j)
        }
    }
}
final.insert(7);final.insert(19);
print(final, final.reduce(0, +))
//for j in priDict {
//    for k in j.value {
//        let inter = priDict[j.key]!.intersection(priDict[k]!)
//        for i in inter {
//            let inter2 = inter.intersection(priDict[i]!)
//            if inter2 != [] {
//                print(j.key, k, i,inter2)
//            }
//        }
//    }
//}
//for i in priDict.sorted(by: {$0.key<$1.key}) {
//    var final: [Int] = [i.key]
//    print(i)
//
//}

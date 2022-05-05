//
//  main.swift
//  PrimeSummations77
//
//  Created by Vincent Snow on 1/1/22.
//
//It is possible to write ten as the sum of primes in exactly five different ways:
//
//7 + 3
//5 + 5
//5 + 3 + 2
//3 + 3 + 2 + 2
//2 + 2 + 2 + 2 + 2
//
//What is the first value which can be written as the sum of primes in over five thousand different ways?

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
func pop(up: Int, num: Int) -> [Int] {
    var arr: [Int] = []
    //let stri = stride(from: up/num, through: 0, by: -1)
    let stri = stride(from: 0, through: up/num, by: 1)
    for i in stri {
        arr.append(i*num)
    }
    return arr
}


for iterator in 10...10 {
    var primePopDict: [[Int]] = []
    let up = iterator

    let sieve = eratosthenesSieve(to: up)
    var count = 0
    for i in sieve.reversed() {
        primePopDict.append(pop(up: up, num: i))
        
    }
    var arrC: [Int] = []
    var comp: [Int] = []
    for i in primePopDict {
        arrC.append(i.count)
        comp.append(1)
    }
    print(arrC,comp,primePopDict)

    nWhile: while arrC != comp {
        print(comp)
        var sum = 0
        var sumArr: [Int] = []
        indLoop: for ind in 0..<comp.count {
            let compIndex = comp[ind]-1
//            let x = primePopDict
//            let y = comp
            sum+=primePopDict[ind][compIndex]
            sumArr.append(primePopDict[ind][compIndex])
            if sum > up {
                if comp[0]+comp[1] > sum {
                    break nWhile
                }
                var lInd = ind
                if comp[ind-1]+1 <= arrC[ind-1] {
                    comp[ind-1]+=1
                } else {
                    comp[ind-2]+=1
                    lInd-=1
                }
                for j in lInd..<comp.count {
                    comp[j] = 1
                }
                continue nWhile
            }

                
                
//                for i in 0..<comp.count {
//                    if comp[i] > 1 {
//                        if i == comp.count-1 {
//                            continue nWhile
//                        }
////                        if i > 0 {
//                            comp[i-1]+=1
////                        } else {
////                         break indLoop
////                        }
//                        for j in i..<comp.count {
//                            comp[j] = 1
//                        }
//                    }
//                }
//                continue nWhile
                
                
//                let stri = stride(from: comp.count-1, through: 0, by: -1)
//                iLoop: for i in stri {
//                    if arrC[i] != comp[i] {
//                        if i == 0 {
////                            comp[i]+=1
//                            continue nWhile
//                        }
//                        if comp[i-1] > arrC[i-1] {
//                            comp[i-2]+=1
//                            comp[i-1]=1
//                        } else {
//                            comp[i-1]+=1
//                        }
//                        if i == comp.count-1 {
//                            comp[i] = 1
//                            continue nWhile
//                        }
//                        for j in i+1...comp.count-1 {
//                            comp[j] = 1
//                        }
//                        continue nWhile
//                    }
//                }
//            }
        }
        let stri = stride(from: comp.count-1, through: 0, by: -1)
        iLoop: for i in stri {
            if arrC[i] != comp[i] {
                comp[i]+=1
                if i == comp.count-1 {
                    break iLoop
                }
                for j in i+1...comp.count-1 {
                    comp[j] = 1
                }
                break iLoop
            }
        }
        if sum == up {
            count+=1
            print(sumArr)
            
        }
    }
    print(count,iterator)
}


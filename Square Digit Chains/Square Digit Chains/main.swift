//
//  main.swift
//  Square Digit Chains
//
//  Created by Vincent Snow on 12/24/20.
//
import Foundation


var getsTo89: [Int] = []
var networkArray: [[Int]] = []
var tempNetworkArray: [Int] = []
var countOf89 = 0
var countOf1 = 0
var neverGetsTo89: [Int] = []
var highestCount = 0
var sum = 0
var totalLoops = 0
var totalCombsEqual1 = 0
var totalPermsEqual1 = 0


//let items = ["0", "1", "2", "3", "4", "5","6"]
//let items2 = "0123456"
//let mappedItems = items2.map { ($0, 1) }
//let counts = Dictionary(mappedItems, uniquingKeysWith: +)

let sevenFact = factorial(a:7)

//for i in counts {
//    fact*=factorial(a:i.value)
//}
//print(sevenFact / fact)

outerLoop: for i in 1...567 {
    var input = String(i)
    sum = 0
    loop89: while sum != 89 && sum != 1 {
        sum = 0
        for i in input {
            let intI = Int(String(i))!
            sum+=(intI*intI)
        }
        if sum == 1 {
            countOf1+=1
            neverGetsTo89.append(i)
            continue outerLoop
        }
        input = String(sum)
    }
}

for x7 in 0...9 {
    for x6 in x7...9 {
        for x5 in x6...9 {
            for x4 in x5...9 {
                for x3 in x4...9 {
                    for x2 in x3...9 {
                        for x1 in x2...9 {
                            let number = [x7,x6,x5,x4,x3,x2,x1]
                            //print(number)
                            totalLoops+=1
                            for i in number {
                                sum+=(i*i)
                            }
                            
                            if neverGetsTo89.contains(sum) {
                                let mappedItems = number.map { ($0, 1) }
                                let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                                totalCombsEqual1+=1
                                var fact = 1
                                for j in counts {
                                    fact*=factorial(a:j.value)
                                }
                                totalPermsEqual1+=(sevenFact/fact)
                                
                            }
                            sum = 0
                        }
                    }
                }
            }
        }
    }
}
print(totalLoops, totalCombsEqual1, totalPermsEqual1, 10000000 - totalPermsEqual1 - 1)

func factorial(a: Int) -> Int {
    let n = a
    if(n == 1){
      return 1
    }else{
        return n*factorial(a:n-1)
    }
}
//outerLoop: for i in 1...567 {
//    var input = String(i)
//    sum = 0
//    if i <= 567 {
//        loop89: while sum != 89 && sum != 1 {
//            sum = 0
////            tempNetworkArray = []
//            for i in input {
//                let intI = Int(String(i))!
//                sum+=(intI*intI)
//            }
////            if sum == 89 {
////                countOf89+=1
////                getsTo89.append(i)
////                continue outerLoop
////            }
////            else
//            if sum == 1 {
//                countOf1+=1
//                neverGetsTo89.append(i)
//                continue outerLoop
//            }
//            input = String(sum)
////            networkArray.append(tempNetworkArray)
//        }
//    }
////    else {
////        for i in input {
////            if i == "0" {
////                continue
////            }
////            let intI = Int(String(i))!
////
////            sum+=(intI*intI)
////        }
////        if neverGetsTo89.contains(sum) {
////            countOf1+=1
////            continue outerLoop
////        }
////    }
//}
////print(neverGetsTo89, countOf1)
//for i in networkArray {
//    print(i)
//}
//print(networkArray.count)



//
//  main.swift
//  Cardano Triplets
//
//  Created by Vincent Snow on 12/30/20.
//

import Foundation

//var trip  = (2.0,1.0,5.0)
var counter = 0

func card(trip: (Double, Double, Double)) {
    let c = sqrt(trip.2)
    let bTimesC = trip.1 * c
    let b = cbrt((trip.0 + bTimesC))
    let a = cbrt((trip.0 - bTimesC))
    let sum = a + b
    print(trip, sum, a, b)
    if sum  == 1 {
        if (trip.0 + trip.1 + trip.2) <= 1000 {
            counter+=1
            print(a, b)
            print("true", trip, counter)
        }
    }
}
for i in 1...200 {
    for j in 1...200 {
        if (i + j) > 1000 {
            continue
        }
        for k in 1...200 {
                counter+=1
        }
    }
    print(counter, i)
}


//for i in 1...200 {
//    for j in 1...200 {
////        if (i + j) > 100 {
////            continue
////        }
//        for k in 1...200 {
//            if (i + j + k) <= 1000 {
//                card(trip: (Double(i), Double(j), Double(k)))
//            } else {
//                continue
//            }
//        }
//    }
//    print(i)
//}
print("Final Counter" , counter)


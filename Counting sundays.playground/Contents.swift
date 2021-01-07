//: Playground - noun: a place where people can play

import UIKit

var year = 1901
var jan = 31
var normFeb = 28
var leapFeb = 29
var mar = 31
var april = 30
var may = 31
var june = 30
var july = 31
var aug = 31
var sept = 30
var oct = 31
var nov = 30
var dec = 31
var dayOfWeek = 3
var counter = 0

func incrementWeekdays () {
    
    if dayOfWeek >= 7 {
        dayOfWeek = 1
    } else {
        dayOfWeek+=1
    }
}

func incrementCounter (dayOfMonth: Int) {
    
    if dayOfMonth == 1 && dayOfWeek == 1 {
        counter+=1
    }
}

func monthLoop(month: Int) {
    
    for i in 1...month {
        incrementCounter(dayOfMonth:i)
        incrementWeekdays()
    }
}

func yearLoop(feb: Int) {
    
    monthLoop(month: jan)
    monthLoop(month: feb)
    monthLoop(month: mar)
    monthLoop(month: april)
    monthLoop(month: may)
    monthLoop(month: june)
    monthLoop(month: july)
    monthLoop(month: aug)
    monthLoop(month: sept)
    monthLoop(month: oct)
    monthLoop(month: nov)
    monthLoop(month: dec)
}

for i in year...2000 {
    if (i % 4 == 0 && i % 100 != 0 || i % 400 == 0) {
        yearLoop(feb: leapFeb)
    } else {
        yearLoop(feb: normFeb)
    }
}

print(counter)

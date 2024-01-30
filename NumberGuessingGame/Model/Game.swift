//
//  Game.swift
//  NumberGuessingGame
//
//  Created by Babypowder on 24/1/2567 BE.
//

import Foundation
struct Game {
    var target = Double.random(in: 0...1)
    var n = 0
    var status = false

    var msg = ""
    mutating func check(guess: Double) {
        let guessNum = lround(guess*100)
        let check = lround(target*100)
        if guessNum == check {
            msg = "You won \n in \(n) tries!"
            status = true
        } else if guessNum < check {
            msg = "The number is greater than \(guessNum) !!"
            n += 1
            status = false
        } else {
            msg = "The number is less than \(guessNum) !!"
            n += 1
            status = false
        }
    return
    }
    
    mutating func startNewGame() {
        n = 0
        target = Double.random(in: 0...1)
    }

    static func value(num: Double) -> Int{
        return lround(num*100)
    }
}

//
//  GenerateNumber.swift
//  MathGame
//
//  Created by Pavel Avlasov on 17.02.2022.
//

import Foundation

final class GenerateNumbers {
    
    var firstTrueNumber: Int?
    var secondTrueNumber: Int?
    var trueAnswer: Int?
    var firstFalseAnswer: Int?
    var secondFalseAnswer: Int?
    var thirdFalseAnswer: Int?
    
    func generateNumbersforPlus() {
        firstTrueNumber = Int.random(in: 4...49)
        secondTrueNumber = Int.random(in: 4...49)
        
        guard let firstTrueNumber = firstTrueNumber,
              let secondTrueNumber = secondTrueNumber else { return }
        trueAnswer = firstTrueNumber + secondTrueNumber
        firstFalseAnswer = Int.random(in: 8...98)
        secondFalseAnswer = Int.random(in: 8...98)
        thirdFalseAnswer = Int.random(in: 8...98)
    }
    
    func generateNumbersForMinus() {
        firstTrueNumber = Int.random(in: 4...99)
        guard let firstTrueNumber = firstTrueNumber else { return }

        secondTrueNumber = Int.random(in: 2...firstTrueNumber)
        
        guard let secondTrueNumber = secondTrueNumber else { return }
        trueAnswer = firstTrueNumber - secondTrueNumber
        firstFalseAnswer = Int.random(in: 8...98)
        secondFalseAnswer = Int.random(in: 8...98)
        thirdFalseAnswer = Int.random(in: 8...98)
    }
    
    func generateNumbersForMultiply() {
        firstTrueNumber = Int.random(in: 4...49)
        secondTrueNumber = Int.random(in: 4...49)
        guard let firstTrueNumber1 = firstTrueNumber,
              let secondTrueNumber1 = secondTrueNumber else { return }
        while (firstTrueNumber1 * secondTrueNumber1) > 99 {
            firstTrueNumber = Int.random(in: 4...49)
            secondTrueNumber = Int.random(in: 4...49)
        }
        
//        trueAnswer = firstTrueNumber * secondTrueNumber
        firstFalseAnswer = Int.random(in: 8...98)
        secondFalseAnswer = Int.random(in: 8...98)
        thirdFalseAnswer = Int.random(in: 8...98)
    }
    
    func generateNumbersForDivision() {
        firstTrueNumber = Int.random(in: 4...50)
        
        guard let firstTrueNumber = firstTrueNumber else { return }
        secondTrueNumber = Int.random(in: 4...firstTrueNumber)

        while ((firstTrueNumber % (secondTrueNumber ?? firstTrueNumber)) != 0) {
            secondTrueNumber = Int.random(in: 1...firstTrueNumber)
        }
        
        guard let secondTrueNumber = secondTrueNumber else { return }

        trueAnswer = firstTrueNumber / secondTrueNumber
        firstFalseAnswer = Int.random(in: 8...98)
        secondFalseAnswer = Int.random(in: 8...98)
        thirdFalseAnswer = Int.random(in: 8...98)
    }
}

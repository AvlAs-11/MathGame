//
//  PlayViewController.swift
//  MathGame
//
//  Created by Pavel Avlasov on 20.02.2022.
//

import Foundation
import UIKit

class PlayViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var selectedSign: SignEnum?
    
    var signString: String?
    
    var playView = PlayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        generateNumbers()
        
    }
    
    private func configuration() {
        let frame = view.frame
        playView = PlayView(frame: frame)
        view.addSubview(playView)
        print(selectedSign)
    }
    
    private func setNumbers(generator: GenerateNumbers, trueAnswerNumber: Int) {

        guard let trueAnswer = generator.trueAnswer,
              let firstFalseAnswer = generator.firstFalseAnswer,
              let secondFalseAnswer = generator.secondFalseAnswer,
              let thirdFalseAnswer = generator.thirdFalseAnswer,
              let firstTrueNumber = generator.firstTrueNumber,
              let secondTrueNumber = generator.secondTrueNumber,
              let signString = self.signString
        else { return }

        switch trueAnswerNumber {
        case 1:
            playView.firstAnswerButton.setTitle("\(trueAnswer)", for: .normal)
            playView.secondAnswerButton.setTitle("\(firstFalseAnswer)", for: .normal)
            playView.thirdAnswerButton.setTitle("\(secondFalseAnswer)", for: .normal)
            playView.fourthAnswerButton.setTitle("\(thirdFalseAnswer)", for: .normal)

        case 2:
            playView.secondAnswerButton.setTitle("\(trueAnswer)", for: .normal)
            playView.firstAnswerButton.setTitle("\(firstFalseAnswer)", for: .normal)
            playView.thirdAnswerButton.setTitle("\(secondFalseAnswer)", for: .normal)
            playView.fourthAnswerButton.setTitle("\(thirdFalseAnswer)", for: .normal)
        case 3:
            playView.thirdAnswerButton.setTitle("\(trueAnswer)", for: .normal)
            playView.firstAnswerButton.setTitle("\(firstFalseAnswer)", for: .normal)
            playView.secondAnswerButton.setTitle("\(secondFalseAnswer)", for: .normal)
            playView.fourthAnswerButton.setTitle("\(thirdFalseAnswer)", for: .normal)
        case 4:
            playView.fourthAnswerButton.setTitle("\(trueAnswer)", for: .normal)
            playView.firstAnswerButton.setTitle("\(firstFalseAnswer)", for: .normal)
            playView.secondAnswerButton.setTitle("\(secondFalseAnswer)", for: .normal)
            playView.thirdAnswerButton.setTitle("\(thirdFalseAnswer)", for: .normal)
        default:
            break
        }

        playView.exampleLable.text = "\(firstTrueNumber) \(signString) \(secondTrueNumber)"
        
    }

    private func generateNumbers() {

        let generator = GenerateNumbers()

        switch selectedSign {

        case .plus:
            generator.generateNumbersforPlus()
            signString = " + "
        case .minus:
            generator.generateNumbersForMinus()
            signString = " - "
        case .multiply:
            generator.generateNumbersForMultiply()
            signString = " X "
        case .division:
            generator.generateNumbersForDivision()
            signString = " / "
        default:
            break
        }
        let trueAnswerNumber = Int.random(in: 1...4)
        setNumbers(generator: generator, trueAnswerNumber: trueAnswerNumber)

    }
}

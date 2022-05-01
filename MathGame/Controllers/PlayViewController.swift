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
    var generator = GenerateNumbers()
    var trueAnswerNumber: Int?
    var scoreCounter = 0
    var timer: Timer?
    var leftTime = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        addTargetsToButtons()
        generateNumbers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    private func configuration() {
        let frame = view.frame
        playView = PlayView(frame: frame)
        view.addSubview(playView)
        playView.timerLabel.isHidden = false
        playView.timerLabel.text = "00:\(leftTime)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    private func addTargetsToButtons() {
        playView.stopGameButton.addTarget(self, action: #selector(stopGame), for: .touchUpInside)
        playView.firstAnswerButton.addTarget(self, action: #selector(checkingAnswer), for: .touchUpInside)
        playView.secondAnswerButton.addTarget(self, action: #selector(checkingAnswer), for: .touchUpInside)
        playView.thirdAnswerButton.addTarget(self, action: #selector(checkingAnswer), for: .touchUpInside)
        playView.fourthAnswerButton.addTarget(self, action: #selector(checkingAnswer), for: .touchUpInside)
    }

    @objc private func stopGame() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func checkingAnswer(button: UIButton) {
        print(button.tag)
        if button.tag == trueAnswerNumber {
            playView.correctAnswerLabel.isHidden = false
            playView.scoreLabel.isHidden = false
            scoreCounter += 1
            playView.scoreLabel.text = "\(scoreCounter)"
        }
        else {
            playView.correctAnswerLabel.isHidden = true
        }
        generateNumbers()
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
            signString = " \u{00F7} "
        default:
            break
        }
        trueAnswerNumber = Int.random(in: 1...4)
        guard let trueAnswerNumber = trueAnswerNumber else { return }

        setNumbers(generator: generator, trueAnswerNumber: trueAnswerNumber)
    }
    
    @objc private func updateTimer() {
        print(leftTime)
        if leftTime == 0 {
            presentEndViewController()
        }
        leftTime -= 1
        playView.timerLabel.text = "00:\(leftTime)"
    }
    
    private func presentEndViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let endGameViewController = storyboard.instantiateViewController(withIdentifier: "EndGameVC") as! EndGameViewController
        endGameViewController.score = self.scoreCounter
        navigationController?.pushViewController(endGameViewController, animated: true)
    }
}

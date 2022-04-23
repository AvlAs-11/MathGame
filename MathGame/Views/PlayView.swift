//
//  PlayView.swift
//  MathGame
//
//  Created by Pavel Avlasov on 19.04.2022.
//

import Foundation
import UIKit

class PlayView: UIView {
    
    lazy var firstAnswerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.setTitleColor(UIColor(named: "PlusButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 40)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var secondAnswerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.setTitleColor(UIColor(named: "MinusButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 40)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.setTitleColor(UIColor(named: "MultiplyButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 40)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var fourthAnswerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.setTitleColor(UIColor(named: "DivisionButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 40)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var exampleLable: UILabel = {
        let label = UILabel()
        label.text = "example"
        label.font = UIFont(name: "ArialMT", size: 30)
        label.textColor = UIColor(named: "ExampleLabelColor")
        label.backgroundColor = UIColor(named: "BackgroundButtonColor")
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    lazy var correctAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Correct!"
        label.font = UIFont(name: "ArialMT", size: 40)
        label.textColor = UIColor(named: "CorrectLabelColor")
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 34)
        label.textColor = UIColor(named: "TimerLabelColor")
        label.isHidden = true
        return label
    }()
    
    lazy var stopGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Stop Game", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        return button
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont(name: "ArialMT", size: 40)
        label.textColor = UIColor(named: "ScoreLabelColor")
        label.isHidden = true
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(firstAnswerButton)
        addSubview(secondAnswerButton)
        addSubview(thirdAnswerButton)
        addSubview(fourthAnswerButton)
        addSubview(exampleLable)
        addSubview(correctAnswerLabel)
        addSubview(timerLabel)
        addSubview(stopGameButton)
        addSubview(scoreLabel)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        firstAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        secondAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        thirdAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        fourthAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        exampleLable.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        stopGameButton.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstAnswerButton.widthAnchor.constraint(equalToConstant: 80),
            firstAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            secondAnswerButton.widthAnchor.constraint(equalToConstant: 80),
            secondAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            thirdAnswerButton.widthAnchor.constraint(equalToConstant: 80),
            thirdAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            fourthAnswerButton.widthAnchor.constraint(equalToConstant: 80),
            fourthAnswerButton.heightAnchor.constraint(equalToConstant: 80),
            exampleLable.widthAnchor.constraint(equalToConstant: 170),
            exampleLable.heightAnchor.constraint(equalToConstant: 40),
            correctAnswerLabel.widthAnchor.constraint(equalToConstant: 170),
            correctAnswerLabel.heightAnchor.constraint(equalToConstant: 80),
            timerLabel.widthAnchor.constraint(equalToConstant: 170),
            timerLabel.heightAnchor.constraint(equalToConstant: 40),
            stopGameButton.widthAnchor.constraint(equalToConstant: 170),
            stopGameButton.heightAnchor.constraint(equalToConstant: 60),
            scoreLabel.heightAnchor.constraint(equalToConstant: 40),
            scoreLabel.widthAnchor.constraint(equalToConstant: 40),
            firstAnswerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -45),
            firstAnswerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -45),
            secondAnswerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45),
            secondAnswerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -45),
            thirdAnswerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -45),
            thirdAnswerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 45),
            fourthAnswerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45),
            fourthAnswerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 45),
            exampleLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exampleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -135),
            correctAnswerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            correctAnswerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 195),
            timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -195),
            stopGameButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stopGameButton.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 135)
        ])
    }
}

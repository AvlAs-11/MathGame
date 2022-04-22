//
//  MainView.swift
//  MathGame
//
//  Created by Pavel Avlasov on 19.04.2022.
//

import Foundation
import UIKit

class MainView: UIView {
    
    lazy var lastScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.text = " Your last score: "
        label.backgroundColor = UIColor(named: "BackgroundButtonColor")
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    lazy var plusSignButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlusIcon"), for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.layer.cornerRadius = 15
        button.tag = 1
        return button
    }()
    
    lazy var minusSignButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MinusIcon"), for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.layer.cornerRadius = 15
        button.tag = 2
        return button
    }()
    
    lazy var multiplySignButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MultiplyIcon"), for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.layer.cornerRadius = 15
        button.tag = 3
        return button
    }()
    
    lazy var divideSignButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "DivisionIcon"), for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.layer.cornerRadius = 15
        button.tag = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lastScoreLabel)
        addSubview(plusSignButton)
        addSubview(minusSignButton)
        addSubview(multiplySignButton)
        addSubview(divideSignButton)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        lastScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        plusSignButton.translatesAutoresizingMaskIntoConstraints = false
        minusSignButton.translatesAutoresizingMaskIntoConstraints = false
        multiplySignButton.translatesAutoresizingMaskIntoConstraints = false
        divideSignButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lastScoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastScoreLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            plusSignButton.widthAnchor.constraint(equalToConstant: 80),
            plusSignButton.heightAnchor.constraint(equalToConstant: 80),
            minusSignButton.widthAnchor.constraint(equalToConstant: 80),
            minusSignButton.heightAnchor.constraint(equalToConstant: 80),
            multiplySignButton.widthAnchor.constraint(equalToConstant: 80),
            multiplySignButton.heightAnchor.constraint(equalToConstant: 80),
            divideSignButton.widthAnchor.constraint(equalToConstant: 80),
            divideSignButton.heightAnchor.constraint(equalToConstant: 80),
            plusSignButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -45),
            plusSignButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -45),
            minusSignButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45),
            minusSignButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -45),
            multiplySignButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -45),
            multiplySignButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 45),
            divideSignButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45),
            divideSignButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 45),
        ])
    }
}


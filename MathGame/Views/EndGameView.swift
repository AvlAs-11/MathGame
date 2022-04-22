//
//  PlayView.swift
//  MathGame
//
//  Created by Pavel Avlasov on 19.04.2022.
//

import Foundation
import UIKit

class EndGameView: UIView {
    
    lazy var playAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play Again", for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundButtonColor")
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Your score: 1488"
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scoreLabel)
        addSubview(playAgainButton)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.backgroundColor = .black
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
       
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.widthAnchor.constraint(equalToConstant: 170),
            scoreLabel.heightAnchor.constraint(equalToConstant: 80),
            playAgainButton.widthAnchor.constraint(equalToConstant: 170),
            playAgainButton.heightAnchor.constraint(equalToConstant: 80),
            
            scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playAgainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playAgainButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100)
        ])
    }
}

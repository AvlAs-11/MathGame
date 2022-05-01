//
//  EndGameViewController.swift
//  MathGame
//
//  Created by Pavel Avlasov on 21.02.2022.
//

import Foundation
import UIKit

class EndGameViewController: UIViewController {
    
    var score: Int?
    var endGameView = EndGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    private func configuration() {
        let frame = view.frame
        endGameView = EndGameView(frame: frame)
        endGameView.scoreLabel.text = endGameView.scoreLabel.text! + String(score!)
        view.addSubview(endGameView)
    }
}

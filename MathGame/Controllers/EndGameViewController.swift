//
//  EndGameViewController.swift
//  MathGame
//
//  Created by Pavel Avlasov on 21.02.2022.
//

import Foundation
import UIKit

class EndGameViewController: UIViewController {
    
    var endGameView = EndGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    private func configuration() {
        let frame = view.frame
        endGameView = EndGameView(frame: frame)
        view.addSubview(endGameView)
    }
}

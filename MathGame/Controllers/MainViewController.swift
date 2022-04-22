//
//  ViewController.swift
//  MathGame
//
//  Created by Pavel Avlasov on 17.02.2022.
//

import UIKit

class MainViewController: UIViewController {
        
    var mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configuration()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func switchSign(_ sender: UIButton) {
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playViewController = storyboard.instantiateViewController(withIdentifier: "PlayVC") as! PlayViewController
        playViewController.selectedSign = SignEnum(rawValue: sender.tag)
         navigationController?.pushViewController(playViewController,
         animated: true)
    }
    
    private func configuration() {
        let frame = view.frame
        mainView = MainView(frame: frame)
        view.addSubview(mainView)
        
        mainView.plusSignButton.addTarget(self, action: #selector(translitionToPlayVC), for: .touchUpInside)
        mainView.minusSignButton.addTarget(self, action: #selector(translitionToPlayVC), for: .touchUpInside)
        mainView.multiplySignButton.addTarget(self, action: #selector(translitionToPlayVC), for: .touchUpInside)
        mainView.divideSignButton.addTarget(self, action: #selector(translitionToPlayVC), for: .touchUpInside)

    }
    
    @objc private func translitionToPlayVC(button: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playViewController = storyboard.instantiateViewController(withIdentifier: "PlayVC") as! PlayViewController
        playViewController.selectedSign = SignEnum(rawValue: button.tag)
         navigationController?.pushViewController(playViewController,
         animated: true)
    }
}


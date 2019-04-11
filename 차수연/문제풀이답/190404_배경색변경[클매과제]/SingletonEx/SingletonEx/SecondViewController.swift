//
//  SecondViewController.swift
//  SingletonEx
//
//  Created by Kira on 04/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var singleton = Singleton.shared
    
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: singleton.red, green: singleton.green, blue: singleton.blue, alpha: 1)
        
        backButton.frame.size = CGSize(width: 200, height: 50)
        backButton.center = view.center
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        view.addSubview(backButton)
        
    }
    
    @objc func backButtonAction() {
        dismiss(animated: true)
    }
}

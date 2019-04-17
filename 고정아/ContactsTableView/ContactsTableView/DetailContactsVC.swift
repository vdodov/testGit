//
//  DetailContactsVC.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class DetailContactsVC: UIViewController {
    
    let nameLabel = UILabel()
    let numberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeLabels()
    }
    
    
    
    
    func makeLabels() {
        nameLabel.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        numberLabel.frame = CGRect(x: 20, y: 300, width: 300, height: 50)
        nameLabel.backgroundColor = .lightGray
        numberLabel.backgroundColor = .lightGray
        view.addSubview(numberLabel)
        view.addSubview(nameLabel)
    }
}

extension DetailContactsVC: ViewControllerDelegate {
    func tossInformation(_ name: String, _ number: String) {
        nameLabel.text = name
        numberLabel.text = number
    }
    
    
}

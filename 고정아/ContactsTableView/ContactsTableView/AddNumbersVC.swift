//
//  AddNumbersVC.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

protocol AddnumbersVCDelegate: class {
    func reload()
}

class AddNumbersVC: UIViewController {
    
    weak var delegate: AddnumbersVCDelegate?
    
    var xButton : UIImage = UIImage(named: "xbutton")!
    let nameText = UITextField()
    let numberText = UITextField()
    var numberArr = [String]()
    var nameArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        backButton()
        nameTextField()
        numberTextField()
        reloadData()
        confirmButton()
        
        
    }
    func reloadData() {
        let names = UserDefaults.standard.object(forKey: "names") as? [String] ?? []
        let numbers = UserDefaults.standard.object(forKey: "numbers") as? [String] ?? []
        numberArr = numbers
        nameArr = names
    }
    
    
    
    func backButton() {
        let bButton = UIButton()
        bButton.setImage(xButton, for: UIControl.State.normal)
        bButton.frame = CGRect(x: 30, y: 60, width: 30, height: 30)
        bButton.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        bButton.addTarget(self, action: #selector(dis(_:)), for: .touchUpInside)
        view.addSubview(bButton)
    }
    
    func nameTextField() {
        nameText.frame = CGRect(x: view.frame.width / 2 - 150, y: 300, width: 300, height: 40)
        nameText.backgroundColor = .white
        view.addSubview(nameText)
    }
    
    func numberTextField() {
        numberText.frame = CGRect(x: view.frame.width / 2 - 150, y: 400, width: 300, height: 40)
        numberText.backgroundColor = .white
        view.addSubview(numberText)
    }
    
    
    func confirmButton() {
        let cButton = UIButton(type: .system)
        cButton.setTitle("저장", for: .normal)
        cButton.frame = CGRect(x: view.frame.width / 2 - 100 , y: 600 , width: view.frame.width - 200, height: 40)
        
        cButton.backgroundColor = .darkGray
        cButton.tintColor = .white
        cButton.layer.cornerRadius = 10
        cButton.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
        
        view.addSubview(cButton)
    }
    
    
    @objc func dis(_ sender: UIButton) {
        delegate?.reload()
        presentingViewController?.dismiss(animated: true)
        
    }
    
    @objc func goToVC() {
        guard let number = numberText.text, let name = nameText.text else {
            return
        }
        
        numberArr.append(number)
        nameArr.append(name)
        
        UserDefaults.standard.set(nameArr, forKey: "names")
        UserDefaults.standard.set(numberArr, forKey: "numbers")
        
        presentingViewController?.dismiss(animated: true)
        delegate?.reload()
    }
}

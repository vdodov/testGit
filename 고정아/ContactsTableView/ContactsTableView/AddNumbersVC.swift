//
//  AddNumbersVC.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class AddNumbersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        backButton()
        nameTextField()
        numberTextField()
        confirmButton()
        // Do any additional setup after loading the view.
    }
    
    func backButton() {
        let bButton = UIButton()
        bButton.setTitle("X", for: .normal)
        bButton.frame = CGRect(x: 30, y: 60, width: 30, height: 30)
        bButton.backgroundColor = .white
        bButton.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        bButton.addTarget(self, action: #selector(dis(_:)), for: .touchUpInside)
        view.addSubview(bButton)
    }
    
    func nameTextField() {
        let nameText = UITextField()
        nameText.frame = CGRect(x: 50, y: 50, width: 200, height: 30)
        nameText.backgroundColor = .white
        
        view.addSubview(nameText)
    }
    
    func numberTextField() {
        let numberText = UITextField()
        numberText.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
        numberText.backgroundColor = .white
        
        view.addSubview(numberText)
    }
    
    
    func confirmButton() {
        let cButton = UIButton(type: .system)
        cButton.setTitle("저장", for: .normal)
        cButton.frame = CGRect(x: view.frame.width - 200 , y: 500, width: view.frame.width - 200, height: 30)
        cButton.backgroundColor = .white
        cButton.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
    
        view.addSubview(cButton)
    }
    

    @objc func dis(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @objc func goToVC() {
       presentingViewController?.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

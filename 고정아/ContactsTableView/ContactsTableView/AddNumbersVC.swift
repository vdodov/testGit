//
//  AddNumbersVC.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class AddNumbersVC: UIViewController {

    var xButton : UIImage = UIImage(named: "xbutton")!
    

    
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
        bButton.setImage(xButton, for: UIControl.State.normal)
        bButton.frame = CGRect(x: 30, y: 60, width: 30, height: 30)
        bButton.addTarget(self, action: #selector(dis(_:)), for: .touchUpInside)
        view.addSubview(bButton)
    }
    
    func nameTextField() {
        let nameText = UITextField()
        nameText.frame = CGRect(x: view.frame.width / 2 - 150, y: 300, width: 300, height: 40)
        nameText.backgroundColor = .white
        
        view.addSubview(nameText)
    }
    
    func numberTextField() {
        let numberText = UITextField()
        numberText.frame = CGRect(x: view.frame.width / 2 - 150, y: 400, width: 300, height: 40)

//        numberText.center.x = view.frame.width/2
//        numberText.center.y = view.frame.height/3
        
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

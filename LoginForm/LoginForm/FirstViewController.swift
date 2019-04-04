//
//  ViewController.swift
//  LoginForm
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var randomNumber:Int = Int.random(in: 1000 ... 9999) //보안문자 랜덤 생성
    
    
    @IBOutlet weak var 이름TextField: UITextField!
    @IBOutlet weak var 성별SegmentControl: UISegmentedControl!
    @IBOutlet weak var 아이디TextField: UITextField!
    @IBOutlet weak var 비밀번호TextField: UITextField!
    @IBOutlet weak var 비밀번호확인TextField: UITextField!
    @IBOutlet weak var 비밀번호Switch: UISwitch!
    
    
    
    @IBOutlet weak var 보안문자TextField: UITextField!
    @IBOutlet var 보안문자Switch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let SecondVC = segue.destination as! SecondViewController
        SecondVC.성별 = 성별SegmentControl.titleForSegment(at: 성별SegmentControl.selectedSegmentIndex) ?? ""
        
    }
    
    
    
    
    //보안문자
    @IBAction func 보안문자Action(_ sender: UIButton) {

        let alertController = UIAlertController(title: "보안문자", message: "\(randomNumber)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(okAction)
        present(alertController,animated: true)
    }
    
    @IBAction func 보안문자입력Action(_ sender: UITextField) {
        guard let text = sender.text else { return }
        if text == String(randomNumber) {
            보안문자Switch.setOn(true, animated: true)
            print("동일")
        } else {
            print("xxx")
        }
        
//        let isCorrectNumber = text == String(randomNumber) //입력값과 보안문자가 동일한지 확인
//        보안문자Switch.setOn(isCorrectNumber, animated: true) // 보안문자가 동일하면 스위치 ON
//        if String(randomNumber) == text {
//            print("동일")
//        }
        
    }
 
    

    
    
}


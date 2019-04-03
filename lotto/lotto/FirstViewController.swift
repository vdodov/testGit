//
//  ViewController.swift
//  lotto
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var numbers: Set<Int> = [] //중복되지 않는 값 저장
    var result: [Int] = [] //결과 저장 배열
    
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var num3Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapButton() {
        numbers = []
        while numbers.count < 3 {
            let number = Int.random(in: 1 ... 9)
            numbers.insert(number)
        }
        result = [Int](numbers)
        num1Label.text = String(result[0]) //num1Label에 첫번째 수 저장
        num2Label.text = String(result[1])//num2Label에 두번째 수 저장
        num3Label.text = String(result[2])//num3Label에 세번째 수 저장
        print(result)
    }

}


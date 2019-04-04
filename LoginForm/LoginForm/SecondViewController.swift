//
//  SecondViewController.swift
//  LoginForm
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var 이름 = ""
    var 성별 = ""
    var 아이디 = ""

    @IBOutlet weak var 이름Label: UILabel!
    @IBOutlet weak var 성별Label: UILabel!
    @IBOutlet weak var 아이디Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        이름Label.text = 이름
        print(이름)
        
        성별Label.text = 성별
        print(성별)
        
        아이디Label.text = 아이디
        print(아이디)
        

    }
    

}

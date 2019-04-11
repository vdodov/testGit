//
//  ViewController.swift
//  SingletonEx
//
//  Created by Kira on 04/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let redLabel = UILabel()
    let redSlider = UISlider()
    let greenLabel = UILabel()
    let greenSlider = UISlider()
    let blueLabel = UILabel()
    let blueSlider = UISlider()
    
    let nextButton = UIButton()
    
    let space:CGFloat = 70
    let labelSize = CGSize(width: 300, height: 20)
    let silderSize = CGSize(width: 300, height: 50)
    
    var singleton = Singleton.shared

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        
    }
    
    private func configure() {
        redLabel.frame.size = labelSize
        redLabel.center = CGPoint(x: view.center.x, y: space)
        redLabel.text = "Red"
        redLabel.textColor = .white
        redLabel.backgroundColor = .red
        view.addSubview(redLabel)
        
        redSlider.frame.size = silderSize
        redSlider.center = CGPoint(x: view.center.x, y: redLabel.frame.maxY + 20)
        redSlider.tag = 0
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        view.addSubview(redSlider)
        
        greenLabel.frame.size = labelSize
        greenLabel.center = CGPoint(x: view.center.x, y: redSlider.frame.maxY + space)
        greenLabel.text = "Green"
        greenLabel.textColor = .white
        greenLabel.backgroundColor = .green
        view.addSubview(greenLabel)
        
        greenSlider.frame.size = silderSize
        greenSlider.center = CGPoint(x: view.center.x, y: greenLabel.frame.maxY + 20)
        greenSlider.tag = 1
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        view.addSubview(greenSlider)
        
        blueLabel.frame.size = labelSize
        blueLabel.center = CGPoint(x: view.center.x, y: greenSlider.frame.maxY + space)
        blueLabel.text = "Blue"
        blueLabel.textColor = .white
        blueLabel.backgroundColor = .blue
        view.addSubview(blueLabel)
        
        blueSlider.frame.size = silderSize
        blueSlider.center = CGPoint(x: view.center.x, y: blueLabel.frame.maxY + 20)
        blueSlider.tag = 2
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        view.addSubview(blueSlider)
        
        nextButton.frame.size = CGSize(width: 100, height: 40)
        nextButton.center = CGPoint(x: view.center.x, y: 600)
        nextButton.backgroundColor = .darkGray
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    @objc func silderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            singleton.red = CGFloat(sender.value)
        case 1:
            singleton.green = CGFloat(sender.value)
        case 2:
            singleton.blue = CGFloat(sender.value)
        default:
            break
        }
    }
    
    @objc func nextButtonAction() {
        let secVC = SecondViewController()
        present(secVC, animated: true)
    }
    
}




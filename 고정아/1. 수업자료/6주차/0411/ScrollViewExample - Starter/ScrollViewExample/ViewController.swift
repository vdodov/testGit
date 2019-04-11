//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2018. 6. 18..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {

  // MARK: Properties
  
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var imageView: UIImageView!
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Action Handler
  
  @IBAction private func fitToWidth(_ sender: Any) {
    print("\n---------- [ fitToWidth ] ----------")
  }
  
  @IBAction private func scaleDouble(_ sender: Any) {
    print("\n---------- [ scaleDouble ] ----------")
  }

  @IBAction private func moveContentToRight(_ sender: Any) {
    print("\n---------- [ moveContentToRight ] ----------")
  }
}


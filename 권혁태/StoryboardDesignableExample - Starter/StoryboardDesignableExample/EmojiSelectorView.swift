//
//  EmojiSelector.swift
//  StoryboardDesignableExample
//
//  Created by 이봉원 on 14/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

@IBDesignable
final class EmojiSelectorView: UIView {
  
  let emojiDisplayLabel = UILabel()
  let upButton = UIButton(type: .system)
  let downButton = UIButton(type: .system)
  
  let emojis = [
    "😀", "😃", "😄", "😆", "😅",
    "🤲", "👐", "🙌", "👏", "🤝",
    "🐶", "🐱", "🐭", "🐹", "🐰"
  ]
  
    @IBInspectable var currentIndex: Int = 0 {
        didSet {
            let index = currentIndex % emojis.count
            let adjustmentIndex = index < 0 ? index + emojis.count : index
            emojiDisplayLabel.text = emojis[adjustmentIndex]
            
        }
    }
  
    @IBInspectable var emojiAreaRatio: CGFloat = 0.7 {
        didSet { layoutViews() }
    }
    @IBInspectable var emojiLabelBgColor: UIColor? {
        didSet { emojiDisplayLabel.backgroundColor = emojiLabelBgColor }
    }
    @IBInspectable var emojiFontSize: CGFloat = 100 {
        didSet { emojiDisplayLabel.font = .systemFont(ofSize: emojiFontSize) }
    }
    
    @IBInspectable var upButtonBgColor: UIColor? {
        didSet { upButton.backgroundColor = upButtonBgColor }
    }
    @IBInspectable var downButtonBgColor: UIColor? {
        didSet { downButton.backgroundColor = downButtonBgColor }
    }
    @IBInspectable var buttonFontSize: CGFloat = 10 {
        didSet {
            upButton.titleLabel?.font = .systemFont(ofSize: buttonFontSize)
            downButton.titleLabel?.font = .systemFont(ofSize: buttonFontSize)
        }
    }
    
  // MARK: - Initialize
    
    // code 로 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // 스토리보드로 초기화
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        addSubview(emojiDisplayLabel)
        addSubview(upButton)
        addSubview(downButton)
        
        emojiDisplayLabel.text = emojis[currentIndex]
        emojiDisplayLabel.textAlignment = .center
        emojiDisplayLabel.font = UIFont.systemFont(ofSize: emojiFontSize)
        emojiDisplayLabel.backgroundColor = emojiLabelBgColor
        
        upButton.setTitle("⬆︎", for: .normal)
        upButton.setTitleColor(upButtonBgColor, for: .normal)
        upButton.tag = 1
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        upButton.titleLabel?.textAlignment = .center
        upButton.layer.borderWidth = 1
        upButton.layer.borderColor = UIColor.black.cgColor
        upButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
        
        downButton.setTitle("⬇︎", for: .normal)
        downButton.setTitleColor(downButtonBgColor, for: .normal)
        downButton.tag = 2
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        downButton.titleLabel?.textAlignment = .center
        downButton.layer.borderWidth = 1
        downButton.layer.borderColor = UIColor.black.cgColor
        downButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
    }
  
  // MARK: - View Layout
  
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutViews()
    }
    
    func layoutViews() {
        let emojiWidth = frame.width * emojiAreaRatio
        emojiDisplayLabel.frame = CGRect(x: 0, y: 0, width: emojiWidth, height: frame.height)
        
        upButton.frame = CGRect(x: emojiWidth, y: 0, width: frame.width - emojiWidth, height: frame.height/2)
        downButton.frame = CGRect(x: emojiWidth, y: frame.height/2, width: frame.width - emojiWidth, height: frame.height/2)
    }
    
  
  
  // MARK: - Action Handler
  
  @objc func didTapUpDownButton(_ sender: UIButton) {
    switch sender.tag {
    case 1:
        if emojis.count-1 == currentIndex {
            currentIndex = 0
        }
        currentIndex += 1
        emojiDisplayLabel.text = emojis[currentIndex]
    case 2:
        if 0 == currentIndex {
            currentIndex = emojis.count-1
        }
        currentIndex -= 1
        emojiDisplayLabel.text = emojis[currentIndex]
    default:
        return
    }
  }
  
}

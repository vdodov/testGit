
import UIKit
import PlaygroundSupport

final class MyViewController: UIViewController {
  
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonEvent()
    switchEvent()
    segmentedControlEvent()
  }
  
  func setupCommonAttributes(for label: UILabel, title: String, frame: CGRect) {
    label.text = title
    label.frame = frame
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .darkGray
    view.addSubview(label)
  }
  
  
  /***************************************************
   UIButton
   1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
   2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경***************************************************/
  
  let quantityLabel = UILabel()
  
  func buttonEvent() {
    let plusButton = UIButton()
    plusButton.frame = CGRect(x: 110, y: 70, width: 80, height: 30)
    plusButton.setTitle("+ Button", for: .normal)
    plusButton.setTitleColor(.black, for: .normal)
    plusButton.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
    plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
    view.addSubview(plusButton)
    
    let minusButton = UIButton()
    minusButton.frame = CGRect(x: 190, y: 70, width: 80, height: 30)
    minusButton.setTitle("- Button", for: .normal)
    minusButton.setTitleColor(.black, for: .normal)
    minusButton.backgroundColor = UIColor.red.withAlphaComponent(0.4)
    minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
    view.addSubview(minusButton)
    
    let frame = CGRect(x: 140, y: 100, width: 100, height: 30)
    setupCommonAttributes(for: quantityLabel, title: "0", frame: frame)
  }
  
  @objc func increaseQuantity() {
    guard let text = quantityLabel.text,
      let quantity = Int(text)
      else { return }
    quantityLabel.text = String(quantity + 1)
    quantityLabel.textColor = .blue
  }
  
  @objc func decreaseQuantity() {
    guard let text = quantityLabel.text,
      let quantity = Int(text)
      else { return }
    quantityLabel.text = String(quantity - 1)
    quantityLabel.textColor = .red
  }
  
  /***************************************************
   UISwitch
   : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
   ***************************************************/
  
  let switchLabel = UILabel()
  
  func switchEvent() {
    let onOffSwitch = UISwitch()
    onOffSwitch.frame.origin = CGPoint(x: 165, y: 180)
    onOffSwitch.addTarget(self, action: #selector(toggleOnOffText), for: .valueChanged)
    view.addSubview(onOffSwitch)
    
    let frame = CGRect(x: 140, y: 212, width: 100, height: 30)
    setupCommonAttributes(for: switchLabel, title: "Off", frame: frame)
  }
  
  @objc func toggleOnOffText(_ sender: UISwitch) {
    switchLabel.text = sender.isOn ? "On" : "Off"
  }
  
  
  /***************************************************
   UISegmentedControl
   : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
   ***************************************************/
  
  let selectedSegmentedLabel = UILabel()
  
  func segmentedControlEvent() {
    let segmentedControl = UISegmentedControl(items: ["Dog", "Cat", "Bird"])
    segmentedControl.frame = CGRect(x: 115, y: 290, width: 150, height: 30)
    segmentedControl.addTarget(self, action: #selector(showSelectedTitle(_:)), for: .valueChanged)
    view.addSubview(segmentedControl)
    
    let frame = CGRect(x: 140, y: 322, width: 100, height: 30)
    setupCommonAttributes(for: selectedSegmentedLabel, title: "None", frame: frame)
  }
  
  @objc func showSelectedTitle(_ sender: UISegmentedControl) {
    let index = sender.selectedSegmentIndex
    let title = sender.titleForSegment(at: index)
    selectedSegmentedLabel.text = title
  }
}

PlaygroundPage.current.liveView = MyViewController()

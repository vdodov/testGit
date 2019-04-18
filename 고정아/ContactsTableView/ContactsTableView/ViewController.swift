//
//  ViewController.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func tossInformation(_ name: String, _ number: String)
}

class ViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    var check = false
    let tableView = UITableView()
    let detailcontactsVC = DetailContactsVC()
    let addNumbersVC = AddNumbersVC()
    var numbers = UserDefaults.standard.object(forKey: "numbers") as? [String] ?? []
    var names = UserDefaults.standard.object(forKey: "names") as? [String] ?? []
    var people = [String:String]()
    var namesort = [String]()
//    let sectionArr = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        checkData()
        makeDict()
        navigationSet()
        setupTableView()
        addNumbersVC.delegate = self
//                toZero()
    }
    
    func checkData() {
        check = numbers.isEmpty ? true : false
    }
    
    func makeDict() {
        guard !check else {
            return
        }
        for i in 0..<names.count {
        people.updateValue(numbers[i], forKey: names[i])
        }
        namesort = people.keys.sorted()
        print(namesort)
    }
    
    func toZero() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        tableView.reloadData()
    }
    
    func navigationSet() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonAction))
        navigationItem.title = "연락처"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight =  60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
    }
    
    
    @objc private func addBarButtonAction() {
        present(addNumbersVC, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionArr.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = namesort[indexPath.row]
        cell.detailTextLabel?.text = people[namesort[indexPath.row]]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        navigationController?.pushViewController(detailcontactsVC, animated: true)
        let name = namesort[indexPath.row]
        let number = people[namesort[indexPath.row]] ?? ""
        self.delegate = detailcontactsVC
        delegate?.tossInformation(name, number)
        
        return indexPath
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailContactsVC") as? DetailContactsVC else {return}
//        detailVC.modalPresentationStyle = .overCurrentContext
//         self.delegate = detailVC
//        present(detailVC, animated: true)
        
        
    }
}


extension ViewController: AddnumbersVCDelegate {
    func reload() {
        numbers = UserDefaults.standard.object(forKey: "numbers") as? [String] ?? []
        names = UserDefaults.standard.object(forKey: "names") as? [String] ?? []
        makeDict()
        tableView.reloadData()
    }
}

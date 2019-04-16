//
//  ViewController.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let tableView = UITableView()
    let detailcontactsVC = DetailContactsVC()
    
//    var numberCategories: [String: [String]] = [:]
//    var sectionTitles: [String] = []
//    var friendListArr: [String] = []
    
    var test = Array(1...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        navigationSet()
        

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
//        navigationController?.pushViewController(AddNumbersVC(), animated: true)
        present(AddNumbersVC(), animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return test.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    cell.textLabel?.text = "\(test[indexPath.row])"
    return cell

}
    
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
         navigationController?.pushViewController(detailcontactsVC, animated: true)
        return indexPath
    }
}


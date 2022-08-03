//
//  AddPlayerViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/01.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Player"
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.dataSource = self
        tableView.register(AddPlayerTextFieldTableViewCell.self, forCellReuseIdentifier: AddPlayerTextFieldTableViewCell.identifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapBarButton(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapBarButton(_:)))
    }
    @objc
    func tapBarButton(_ sender: UIBarButtonItem) {
        if sender == navigationItem.leftBarButtonItem {
            self.dismiss(animated: true)
        } else {
            print("e")
        }
    }
}
extension AddPlayerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPlayerTextFieldTableViewCell.identifier, for: indexPath) as? AddPlayerTextFieldTableViewCell else { fatalError() }
        if indexPath.section == 0 && indexPath.row == 0 {
            return cell
        } else {
            let basicCell = UITableViewCell()
            basicCell.textLabel?.text = "Game"
            basicCell.accessoryType = .disclosureIndicator
            return basicCell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Player Name"
        } else {
            return nil
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}

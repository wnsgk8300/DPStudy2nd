//
//  CollapsedTableviewViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/14.
//

import UIKit

class CollapsedTableviewViewController: UIViewController {
    
    let tableView = UITableView()
    let tableViewData = [
    ["1", "2", "3", "4", "5"],
    ["1", "2", "3", "4", "5"],
    ["1", "2", "3", "4", "5"],
    ["1", "2", "3", "4", "5"],
    ["1", "2", "3", "4", "5"],
    ]
    
    // Array보다 속도 빠르고 중복될 일이 없기때문에 set사용
    var hiddenSections = Set<Int>()
    
    override func viewDidLoad() {
        setUI()
    }
    @objc
    func didTapSection(_ sender: UIButton) {
        print(sender.tag)
        let section = sender.tag
//        var indexPaths = [IndexPath]()
//        for row in tableViewData[section].indices { // 0..<tableViewData[section].count
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
        
//        let indexPaths = tableViewData[section].indices.map { row in
//            return IndexPath(row: row, section: section)
//        }
        
        let indexPaths = tableViewData[section].indices.map { IndexPath(row: $0, section: section) }
        
        hiddenSections.contains(section) ? showSection(section: section, indexPaths: indexPaths) : hideSection(section: section, indexPaths: indexPaths)
//        tableView.reloadData()
    }
    func hideSection(section: Int, indexPaths: [IndexPath]) {
        hiddenSections.insert(section)
        tableView.deleteRows(at: indexPaths, with: .fade) // reloadData가 포함되어있음
    }
    func showSection(section: Int, indexPaths: [IndexPath]) {
        hiddenSections.remove(section)
        tableView.insertRows(at: indexPaths, with: .fade)
    }
}

extension CollapsedTableviewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hiddenSections.contains(section) ? 0 : tableViewData[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = tableViewData[indexPath.section][indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}

extension CollapsedTableviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle(String(section), for: .normal)
        button.backgroundColor = .blue
        button.tag = section
        button.addTarget(self, action: #selector(didTapSection(_:)), for: .touchUpInside)
        return button
    }
}

// MARK: - UI
extension CollapsedTableviewViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    
    final private func setBasics() {

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    final private func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


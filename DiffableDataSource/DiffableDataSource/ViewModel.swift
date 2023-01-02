//
//  ViewModel.swift
//  DiffableDataSource
//
//  Created by JEON JUNHA on 2023/01/02.
//

import UIKit
import Combine

class ViewModel {
    
    //                                                  section, row
    // hashble해야함
    //    private var dataSource: UITableViewDiffableDataSource<Int, Int>!
    //    private var dataSource: UITableViewDiffableDataSource<Section, Int>!
    private var dataSource: UITableViewDiffableDataSource<SectionClass, Int>!
    let sectionClasses = [SectionClass(name: "1"), SectionClass(name: "2")]
    let numbers = [1, 2, 3]
    private var newNumbers = [4, 5, 6]
    
    func addNewData() {
        updateSnapshot(items: numbers + newNumbers, setion: sectionClasses[1])
    }
    
    private func updateSnapshot(items: [Int], setion: SectionClass) {
        //        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        //        snapshot.appendSections([0, 1])
        //        // hashable이어야함 - 하나의 값이 들어가변 늘 같은 무언가의 값이 나와야함, section이름이 달라야해
        //        snapshot.appendItems([1, 2, 3], toSection: 0)
        //        snapshot.appendItems([4, 5, 6], toSection: 1)
        
        // enum은 hashble이기때문에 자주 함께 사용
        //        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        //        snapshot.appendSections(Section.allCases)
        //        snapshot.appendItems([4, 5, 6], toSection: Section.first)
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionClass, Int>()
        snapshot.appendSections(sectionClasses)
        snapshot.appendItems(items, toSection: setion)
        dataSource.apply(snapshot)
    }
    
    func makeDataSource(tableView: UITableView) {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        //tableview 선택
        
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        // 정석적인 방법
        // dataSource = UITableViewDiffableDataSource<Int, Int>(tableView: <#T##UITableView#>, cellProvider: <#T##UITableViewDiffableDataSource<Int, Int>.CellProvider##UITableViewDiffableDataSource<Int, Int>.CellProvider##(_ tableView: UITableView, _ indexPath: IndexPath, _ itemIdentifier: Int) -> UITableViewCell?#>)
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                fatalError() }
            cell.configure(text: String(itemIdentifier))
            return cell
        })
        updateSnapshot(items: numbers, setion: sectionClasses[0])
    }
}

struct SectionClass: Hashable {
    let name: String
    //uuid를 사용하면 name이 같아도 겹치치 않는다
    //        let uuid: UUID
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        //            hasher.combine(uuid)
    }
}

//
//  RatingViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/01.
//

import UIKit

class RatingViewController: UIViewController {
    
    let tableView = UITableView()
    let titles = ["Bill Evans", "Oscar Peterson", "Dave Brubeck"]
    let subtitles = ["Tic-Tac-Toe", "Spin the Bottle", "Taxas Hold'em Pocker"]
//    let imaged = [UIImage(named: "4Stars"), UIImage(named: "5Stars"), UIImage(named: "2Stars")]
    let imageNames = ["3Stars", "5Stars", "1Stars"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonDidTapped(_:)))
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        // Cell 등록
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc
    func barButtonDidTapped(_ sender: UIBarButtonItem) {
        let vc = AddPlayerViewController()
        let naviVC = UINavigationController(rootViewController: vc)
        self.present(naviVC, animated: true)
    }
}

extension RatingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell을 재사용하기 위함: 스크롤 시
        // Down Casting
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.myTitle.text = titles[indexPath.row]
        // content 사이즈에 맞게 크기를 잡음
        cell.myTitle.sizeToFit()
        cell.mySubTitle.text = subtitles[indexPath.row]
        cell.mySubTitle.sizeToFit()
//        cell.myImageView.image = imaged[indexPath.row]
        cell.myImageView.image = UIImage(named: imageNames[indexPath.row])
        cell.myImageView.contentMode = .scaleAspectFit
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

// MARK: - UI
extension RatingViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        
    }
    final private func setLayout() {
        
    }
}

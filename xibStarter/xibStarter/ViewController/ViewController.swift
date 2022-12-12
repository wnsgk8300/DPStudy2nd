//
//  ViewController.swift
//  xibStarter
//
//  Created by JEON JUNHA on 2022/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        instantiateStrotyboard(type: .home)
    }
    
    enum Stotyboard: String {
        case home = "Home"
    }
    
    func instantiateStrotyboard(type: Stotyboard) {
        let storyboard = UIStoryboard(name: type.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: HomeViewController.identifier)
        vc.view.backgroundColor = .systemRed
        present(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    
}

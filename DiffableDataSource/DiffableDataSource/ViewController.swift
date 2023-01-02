//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by JEON JUNHA on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.makeDataSource(tableView: tableView)
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.addNewData()
    }
}

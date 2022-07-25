//
//  ViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(label)
        label.text = "전준하fwefwefq"
        label.textColor = .white
//        label.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 50, width: 200, height: 100)
        
        label.frame.origin = CGPoint(x: view.frame.midX, y: view.frame.midY)
        label.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
}


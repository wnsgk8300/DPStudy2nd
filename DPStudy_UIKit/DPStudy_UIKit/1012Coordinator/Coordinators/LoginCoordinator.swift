//
//  LoginCoordinator.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/10/12.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .red
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func login() {
        delegate?.didLoggedIn(self)
    }
}

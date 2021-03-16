//
//  MainCoordinator.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 15/03/21.
//

import UIKit
import LoginModule

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func login() {
        let bundle = Bundle(for: LoginViewController.self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:bundle)w
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(nextViewController, animated: true)
    }
    
}

//
//  Coordinator.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 15/03/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

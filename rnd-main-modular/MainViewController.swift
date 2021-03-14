//
//  MainViewController.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 14/03/21.
//

import UIKit
import LoginModule

class MainViewController: UIViewController, Storyboarded {
    
    var window: UIWindow?
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToScreenNext(_ sender: Any) {
        coordinator?.login()
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

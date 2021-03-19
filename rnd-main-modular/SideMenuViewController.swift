//
//  SideMenuViewController.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 18/03/21.
//

import UIKit
import LoginModule
import RWPickFlavor

class SideMenuViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    var mainVC = MainViewController()
    
    weak var delegate: MainProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        add(asChildViewController: loginVC)
    }

    @IBAction func goHome(_ sender: Any) {
        remove(asChildViewController: rwPickVC)
        add(asChildViewController: loginVC)
    }
    
    @IBAction func goFlavor(_ sender: Any) {
        print("hellooo")
//        remove(asChildViewController: loginVC)
//        add(asChildViewController: rwPickVC)
        delegate?.toFlavor()
    }
    
    private lazy var loginVC: LoginViewController = {
        // Load Storyboard
        let bundle = Bundle(for: LoginViewController.self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: nextViewController)

        return nextViewController
    }()
    
    private lazy var rwPickVC: PickFlavorViewController = {
        // Load Storyboard
        let bundle = Bundle(for: PickFlavorViewController.self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PickFlavorViewController") as! PickFlavorViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: nextViewController)

        return nextViewController
    }()


    func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        mainVC.addChild(viewController)

        // Add Child View as Subview
        mainVC.view.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = mainVC.view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: mainVC)
    }

    func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }

}

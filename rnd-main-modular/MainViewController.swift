//
//  MainViewController.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 14/03/21.
//

import UIKit
import LoginModule
import SideMenu
import RWPickFlavor

protocol MainProtocol: class {
    func toFlavor() -> Void
}

extension MainViewController: MainProtocol {
    func toFlavor() -> Void {
        remove(asChildViewController: currentVC)
        print("remove currentvc")
        currentVC = rwPickVC
        print("instantiate rick")
        add(asChildViewController: rwPickVC)
    }
}

class MainViewController: UIViewController, Storyboarded {
    
    
    var window: UIWindow?
    var currentVC: UIViewController = LoginViewController()
    weak var coordinator: MainCoordinator?
    
    var menu: SideMenuNavigationController?
    
//    var sideVC: SideMenuViewController?
    
    let loginViewController = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        let mainVC = SideMenuViewController(nibName:"SideMenuViewController", bundle:nil)
        menu = SideMenuNavigationController(rootViewController: mainVC)
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        menu?.menuWidth = 300
        
        
//        sideVC?.delegate = self
        mainVC.delegate = self
        
//
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        menu?.presentationStyle = SideMenuPresentationStyle.menuSlideIn
        currentVC = loginVC
        updateView(view: currentVC)
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


    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        view.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    func toLoginX() -> Void {
        remove(asChildViewController: currentVC)
        currentVC = loginVC
        add(asChildViewController: loginVC)
    }
    
//    func toFlavor() -> Void {
//        remove(asChildViewController: currentVC)
//        print("remove currentvc")
//        currentVC = rwPickVC
//        print("instantiate rick")
//        add(asChildViewController: rwPickVC)
//    }

    private func updateView(view: UIViewController) {
        add(asChildViewController: view)
    }
    
    @IBAction func goToLogin(_ sender: Any) {
//        if currentVC == loginVC {
//            toFlavor()
//        } else {
//        toLogin()
//        }
        coordinator?.login()
    }
    
    
    @IBAction func bugerMenu(_ sender: Any) {
        present(menu!, animated: true)
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


//
//  MainViewController.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 14/03/21.
//

import UIKit
import LoginModule
import SideMenu

class MainViewController: UIViewController, Storyboarded {
    
    var window: UIWindow?
    weak var coordinator: MainCoordinator?
    
    var menu: SideMenuNavigationController?
    
    let loginViewController = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = SideMenuViewController(nibName:"SideMenuViewController", bundle:nil)
        menu = SideMenuNavigationController(rootViewController: mainVC)
        menu?.leftSide = true
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        menu?.presentationStyle = SideMenuPresentationStyle.menuSlideIn
//        updateView()
    }

    private lazy var loginVC: UIViewController = {
        // Load Storyboard
        let bundle = Bundle(for: LoginViewController.self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

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

    private func updateView() {

        add(asChildViewController: loginVC)

        /*
         if segmentedControl.selectedSegmentIndex == 0 {
         remove(asChildViewController: sessionsViewController)
         add(asChildViewController: summaryViewController)
         } else {
         remove(asChildViewController: summaryViewController)
         add(asChildViewController: sessionsViewController)
         }
         */
    }
    
    
    
    @IBAction func goToScreenNext(_ sender: Any) {
//        coordinator?.login()
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


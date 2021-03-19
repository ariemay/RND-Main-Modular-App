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

    @IBOutlet weak var profPic: UIImageView!
    @IBOutlet var contentView: UIView!
    var mainVC = MainViewController()
    
    weak var delegate: NavigationFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profPic.layer.borderWidth=1.0
        profPic.layer.masksToBounds = false
        profPic.layer.cornerRadius = 30
        profPic.clipsToBounds = true
        profPic.image = UIImage(named: "profpic")
        
    }

    @IBAction func toLogin(_ sender: Any) {
        delegate?.toLogin()
    }
    
    @IBAction func toFlavor(_ sender: Any) {
        delegate?.toFlavor()
    }
    
}

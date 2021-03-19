//
//  LoginViewController.swift
//  rnd-login-module
//
//  Created by Arie May Wibowo on 12/03/21.
//

import UIKit

public class LoginViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        print("helpp")
    
    }
    
    @IBAction func toMainPage(_ sender: Any, completion: @escaping (String) -> Void) {
        completion("hajar")
    }


}

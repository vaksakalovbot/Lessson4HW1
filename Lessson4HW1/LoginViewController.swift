//
//  LoginViewController.swift
//  Lessson4HW1
//
//  Created by vaksakalov on 30.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!    
    @IBOutlet var loginImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.userInterfaceIdiom == .phone {
            print("running on iPhone")
            if UIDevice.current.orientation.isLandscape {
                print("Landscape")
                loginImage.isHidden = true
            } else {
                print("Portrait")
                loginImage.isHidden = false
            }
        }
    }
    
    @IBAction func logIn() {
    }
    
    @IBAction func forgotUserName() {
    }
    
    @IBAction func forgotPassword() {
    }
    
}


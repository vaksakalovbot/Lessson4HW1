//
//  LogoutViewController.swift
//  Lessson4HW1
//
//  Created by vaksakalov on 30.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    private let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        if let userName = userName {
            welcomeLabel.text = "Welcome, \(userName)!"
        }
    }
        
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = self.view.bounds
    }
    
}

//
//  LoginViewController.swift
//  Lessson4HW1
//
//  Created by vaksakalov on 30.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: IBOutlets
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!    
    @IBOutlet var loginImage: UIImageView!
    
    //MARK: Private Properties
    let loginPassword = LoginPassword(userName: "Vladimir", password: "MyPassword")

    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameField.delegate = self
        self.passwordField.delegate = self

        showLogo()
        
        // Алексей, если подскажешь, как определить при старте приложения правильную ориентацию устройства, то следующие строки уберу
        // Понимаю, что это костыли, но UIDevice.current.orientation.isLandscape при запуске работает криво, поэтому пришлось так выкручиваться
        if UIDevice.current.userInterfaceIdiom == .phone {
            if self.view.bounds.height < self.view.bounds.width {
                loginImage.isHidden = true
            }
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        showLogo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTabBarSegue" {
            let tabBarController = segue.destination as! UITabBarController
            let destinationVC = tabBarController.viewControllers?.first as! LogoutViewController
            destinationVC.userName = userNameField.text
        }
    }
    
    //MARK: IBActions
    @IBAction func logIn() {
        checkLoginAndPassword()
    }
    
    @IBAction func forgotUserName() {
        showAlert(withTitle: "User name", andMessage: loginPassword.userName)
    }
    
    @IBAction func forgotPassword() {
        showAlert(withTitle: "Password", andMessage: loginPassword.password)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }

    //MARK: Private Methods
    private func showLogo() {
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
    
    private func checkLoginAndPassword() {
        if userNameField.text == loginPassword.userName && passwordField.text == loginPassword.password {
            performSegue(withIdentifier: "showTabBarSegue", sender: self) // Что здесь следует передвать в sender?
        } else {        
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
        }
    }
    
}

extension LoginViewController {
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameField:
            self.passwordField.becomeFirstResponder()
            return false
        case passwordField:
            textField.resignFirstResponder()
            self.checkLoginAndPassword()
            return false
        default:
            // Алексей, как идентифицировать имя объекта, переданного в textField ? На случай, если добавлю еще одно поле, но не опишу его в switch
            print("\(textField.description) textFieldShouldReturn")
            return false
        }
    }
}


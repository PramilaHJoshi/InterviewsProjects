//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Pradeep Kumar Yeligandla on 09/09/24.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var usernameTXTField: UITextField!
    
    @IBOutlet weak var passwordTXTField: UITextField!
    
    private let loginViewModel: LoginViewModelProtocol = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        debugPrint(loginViewModel.getPersistentStorePath()!)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        let username = usernameTXTField.text ?? ""
        let password = passwordTXTField.text ?? ""
        if loginViewModel.login(username: username, password: password) {
            print("Login Successful")
            // Navigate to the next screen
        } else {
            print("Login Failed")
            // Show error message
        }
    }
    
    
    @IBAction func saveBtnAction(_ sender: Any) {
        let username = usernameTXTField.text ?? ""
        let password = passwordTXTField.text ?? ""
        loginViewModel.saveUser(username: username, password: password)
    }
    
}


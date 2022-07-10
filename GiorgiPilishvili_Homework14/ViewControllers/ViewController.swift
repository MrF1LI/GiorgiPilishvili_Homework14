//
//  ViewController.swift
//  GiorgiPilishvili_Homework14
//
//  Created by GIORGI PILISSHVILI on 08.07.22.
//

import UIKit

protocol RegistrationDelegate {
    func register(username: String, email: String, password: String)
}

class ViewController: UIViewController {
    
    // MARK: Variables

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var username: String?
    var email: String?
    var password: String?
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Functions

    @IBAction func logIn(_ sender: UIButton) {
        guard let username = textFieldUsername.text else { return }
        guard let password = textFieldPassword.text else { return }
        
        if username.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Authorization", message: "Please fill the form.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        authorization(username: username, password: password)
        
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
        guard let vc = vc else { return }
        (vc as? SignUpViewController)?.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func authorization(username: String, password: String) {
        
        if username == self.username, password == self.password {
            textFieldUsername.text = ""
            textFieldPassword.text = ""
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            guard let vc = vc else { return }
            vc.username = username
            vc.email = email
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("failed")
            let alert = UIAlertController(title: "Authorization", message: "Authorization failed. Incorrect credentials.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
    }
    

}

// MARK: Extension for pass data

extension ViewController: RegistrationDelegate {
    func register(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
        textFieldUsername.text = ""
        textFieldPassword.text = ""
    }
}

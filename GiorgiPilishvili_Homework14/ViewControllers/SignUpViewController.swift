//
//  SignUpViewController.swift
//  GiorgiPilishvili_Homework14
//
//  Created by GIORGI PILISSHVILI on 09.07.22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Variables
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    var delegate: RegistrationDelegate?
    
    // MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: Functions

    @IBAction func goToLogIn(_ sender: UIButton) {
        goToLogInPage()
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        guard let username = textFieldUsername.text else { return }
        guard let email = textFieldEmail.text else { return }
        guard let password = textFieldPassword.text else { return }
        guard let confirmPassword = textFieldConfirmPassword.text else { return }
        
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            showRegistrationAlert(message: "Please fill the form.")
            return
        }
        
        if password != confirmPassword {
            showRegistrationAlert(message: "Passwords doesn't match.")
            return
        }
        
        let isValidPass = !isValidPassword(password: password)
        if isValidPass {
            showRegistrationAlert(message: "This password is not secure.")
            return
        }
        
        // Registration success
        
        delegate?.register(username: username, email: email, password: password)
        goToLogInPage()

    }
    
    func goToLogInPage() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showRegistrationAlert(message: String) {
        let alert = UIAlertController(title: "Registration", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func isValidPassword(password: String) -> Bool {
        
        let texttest = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
        guard texttest.evaluate(with: password) else { return false }

        let texttest1 = NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*")
        guard texttest1.evaluate(with: password) else { return false }
        
        return password.count >= 8
        
    }
    
}

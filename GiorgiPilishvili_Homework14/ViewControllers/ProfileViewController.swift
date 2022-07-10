//
//  ProfileViewController.swift
//  GiorgiPilishvili_Homework14
//
//  Created by GIORGI PILISSHVILI on 09.07.22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    var username: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        initUserInfo()
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Are you sure want to sign out?", message: title, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.logOut()
        }))
        
        self.present(alertController, animated: true)
        
    }
    
    func initUserInfo() {
        labelUsername.text = username
        labelEmail.text = email
    }
    
    func logOut() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}

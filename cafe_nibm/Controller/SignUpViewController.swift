//
//  SignUpViewController.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-22.
//

import UIKit
import Firebase
import Loaf

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func onSignUpPressed(_ sender: UIButton) {
        if !InputValidator.isValidName(name: txtName.text ?? ""){
            Loaf("Invalid name! ", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidEmail(email: txtName.text ?? ""){
            Loaf("Invalid email! ", state: .error, sender: self).show()
            return
        }
        if !InputValidator.isValidMobileNo(txtPhone.text ?? ""){
            Loaf("Invalid Mobile number! ", state: .error, sender: self).show()
            return
        }
        if !InputValidator.isValidPassword(pass: txtPassword.text ?? "", minLength: 6, maxLength: 20){
            Loaf("Invalid password! ", state: .error, sender: self).show()
            return
        }
        registerUser(email: txtEmail.text!, password: txtPassword.text!)
        
    }
    
    
    @IBAction func onSignInPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  
    func registerUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("Registration failed! ", state: .error, sender: self).show()
                return
            }
            
            if let result = authResult {
                print("User added with Email: \(result.user.email ?? "Not found")")
                Loaf("Registration successful! ", state: .success, sender: self).show()
            }
        }
    }
    
  

}



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
        if validateInput() {
            registerUser(email: txtEmail.text!, password: txtPassword.text!)
        }else{
            print("Input Errors found")
        }
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
    
    func validateInput() -> Bool {
        guard let name = txtName.text else {
            print("Name is NULL")
            return false
        }
        guard let email = txtEmail.text else {
            print("Email is NULL")
            return false
        }
        guard let phone = txtPhone.text else {
            print("Phone number is NULL")
            return false
        }
        guard let password = txtPassword.text else {
            print("Password is NULL")
            return false
        }
        
        if name.count < 5 {
            print("Enter a valid name")
            return false
        }
        if email.count < 5 {
            print("Enter a valid email")
            return false
        }
        if phone.count < 10 {
            print("Enter a valid phone number")
            return false
        }
        if password.count < 5 {
            print("Enter a valid password")
            return false
        }
        
        return true
    }

}



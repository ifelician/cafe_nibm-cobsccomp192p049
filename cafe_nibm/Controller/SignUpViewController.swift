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
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func onSignUpPressed(_ sender: UIButton) {
        if !InputValidator.isValidName(name: txtName.text ?? ""){
            Loaf("Invalid name! ", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidEmail(email: txtEmail.text ?? ""){
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
        let user = User(userName: txtName.text ?? "", userEmail: txtEmail.text ?? "", userPassword: txtPassword.text ?? "", userPhone: txtPhone.text ?? "")
        
        registerUser(user: user)
        
    }
    
    
    @IBAction func onSignInPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  
    func registerUser(user: User){
        Auth.auth().createUser(withEmail: user.userEmail, password: user.userPassword) { authResult, error in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("Registration failed! ", state: .error, sender: self).show()
                return
            }
            
           
            self.saveUserData(user: user)
            
            if let result = authResult {
                print("User added with Email: \(result.user.email ?? "Not found")")
                Loaf("Registration successful! ", state: .success, sender: self).show()
            }
        }
    }
    
    func saveUserData(user: User){
        let userData = [
            "userName" : user.userName,
            "userEmail" : user.userEmail,
            "userPhone" : user.userPhone,
            "userPassword" : user.userPassword
        ]
        self.ref.child("users")
            .child(user.userEmail
                    .replacingOccurrences(of: "@", with: "_")
                    .replacingOccurrences(of: ".", with: "_")).setValue(userData){
            (error, ref) in
            
            if let err = error{
                print(err.localizedDescription)
                Loaf("User data not saved to Database! ", state: .error, sender: self).show()
                return
            }
                        Loaf("User data saved to Database!", state: .success, sender: self).show(){
                            type in
                            self.dismiss(animated: true, completion: nil)
                        }
                       
        }
    }
    
  

}



//
//  SignInViewController.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-14.
//

import UIKit
import Firebase
import Loaf

class SignInViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    //Option type
    var num: Int?
    //NonOptional type
    var num1: Int = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onLoginPress(_ sender: UIButton) {
        if validateInpu(){
            Authenticate(email: txtEmail.text!, password: txtPwd.text!)
        } else {
            print("Input Error Found.")
        }
    }
    
    func validateInpu() -> Bool {
        guard let email = txtEmail.text else {
            print("Email is null")
            return false
        }
        guard let pwd = txtPwd.text else{
            print("Password is null")
            return false
        }
        
        if email.count < 5 {
            print("Enter valid Email.")
            return false
        }
        
        if pwd.count < 5 {
            print("Enter valid Password")
            return false
        }
        
        return true
    }
    
    func Authenticate(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("Username or Password Invalid", state: .error, sender: self).show()
                return
            }
            
            //Save user login state
            let sessionManager = SessionManager()
            sessionManager.saveUserLogin()
            self.performSegue(withIdentifier: "SignInToHome", sender: nil  )
        }
    }
    

}

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
        
        if !InputValidator.isValidEmail(email: txtEmail.text ?? ""){
            Loaf("Invalid email! ", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidPassword(pass: txtPwd.text ?? "", minLength: 6, maxLength: 20){
            Loaf("Invalid password! ", state: .error, sender: self).show()
            return
        }
        Authenticate(email: txtEmail.text!, password: txtPwd.text!)
         
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

//
//  LaunchViewController.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-30.
//

import UIKit

class LaunchViewController: UIViewController {

    let sessionMGR = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionMGR.getLoggedState(){
            self.performSegue(withIdentifier: "LaunchToHome", sender: nil)
            
        }else {
            self.performSegue(withIdentifier: "LaunchToSignIn", sender: nil)
        }
    }
    
}

//
//  ProfileViewController.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-30.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignOutPressed(_ sender: UIButton) {
        let sessionMGR = SessionManager()
        sessionMGR.clearUserLoggedState()
    }
    
}

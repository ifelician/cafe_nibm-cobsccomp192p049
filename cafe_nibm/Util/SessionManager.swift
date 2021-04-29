//
//  SessionManager.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-28.
//

import Foundation

class SessionManager {
    
    //write value to userDefaults
    //UserDefaults.standard.set([VALUE TO BE STORED], forKey: [KEY VALUE])
    
    //Read value from UserDefaults
    //UserDefaults.standard.bool([VALUE TO BE STORED], forKey: [KEY VALUE])
    //UserDefaults.standard.string([VALUE TO BE STORED], forKey: [KEY VALUE])
    //UserDefaults.standard.float([VALUE TO BE STORED], forKey: [KEY VALUE])
    
    func getLoggedState() -> Bool {
        return UserDefaults.standard.bool(forKey: "USER_LOGGED")
        
    }
    func saveUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "USER_LOGGED")
    }
    
    func clearUserLoggedState(){
        UserDefaults.standard.setValue(false, forKey: "USER_LOGGED")
    }
}

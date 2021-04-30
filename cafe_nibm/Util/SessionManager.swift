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
    func saveUserLogin(user: User) {
        UserDefaults.standard.setValue(true, forKey: "USER_LOGGED")
        UserDefaults.standard.setValue(user.userName, forKey: "USER_NAME")
        UserDefaults.standard.setValue(user.userEmail, forKey: "USER_EMAIL")
        UserDefaults.standard.setValue(user.userPhone, forKey: "USER_PHONE")
    }
    
    func getUserData() -> User {
        let user = User(
            userName: UserDefaults.standard.string(forKey: "USER_NAME") ?? "",
            userEmail: UserDefaults.standard.string(forKey: "USER_EMAIL") ?? "",
            userPassword: "",
            userPhone: UserDefaults.standard.string(forKey: "USER_PHONE") ?? "")
        
        return user
    }
    
    func clearUserLoggedState(){
        UserDefaults.standard.setValue(false, forKey: "USER_LOGGED")
    }
}

//
//  DefaultDataManager.swift
//  GRABULL
//
//  Created by Apple on 14/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class DefaultDataManager: NSObject {

    
    class func SaveDeviceToken(_ token :String){
        let kUserDefault = UserDefaults.standard
        if token != nil {
            kUserDefault.set(token, forKey: "DeviceToken")
            kUserDefault.synchronize()
        }
    }
    
    class func getDeviceToken() -> String{
        let kUserDefault = UserDefaults.standard
        if let Token = kUserDefault.value(forKey: "DeviceToken")  {
            return Token as! String
        }
        return ""
    }
    
    
    class func saveUserId(_ userId :String){
        let kUserDefault = UserDefaults.standard
        if userId != nil {
            kUserDefault.set(userId, forKey: "userId")
            kUserDefault.synchronize()
        }
    }
    
    class func getUserId() -> String{
        let kUserDefault = UserDefaults.standard
        if let userId = kUserDefault.value(forKey: "userId")  {
            return userId as! String
        }
        return ""
    }
    
    class func deleteUserId() {
        let kUserDefault = UserDefaults.standard
        if let userId = kUserDefault.value(forKey: "userId")  {
            kUserDefault.removeObject(forKey: "userId")
            
        }
        
    }
    
    
    
}

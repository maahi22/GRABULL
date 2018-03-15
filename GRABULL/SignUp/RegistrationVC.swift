//
//  RegistrationVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmailAdd: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   
    @IBAction func signUpClick(_ sender: Any) {
    
        txtUserName.resignFirstResponder()
        txtEmailAdd.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtMobileNo.resignFirstResponder()
        
        guard
            let userName = txtUserName.text, !userName.isEmpty,
            let emailId = txtEmailAdd.text, !emailId.isEmpty,
            let password = txtUserName.text, !password.isEmpty,
            let mobileno = txtEmailAdd.text, !mobileno.isEmpty
            else {
                let alert = UIAlertController(title: "Alert!", message: "Please enter medatory fields", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
        }
        
        
        if !Validations.isValidEmail(emailId){
            let alert = UIAlertController(title: "Alert!", message: "Please enter valid email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let urlString = baseUrl + Api_Registration
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let paramString = ["DeviceId":deviceID,"MobileNo":mobileno,"EmailID":emailId,"username":userName,"Password":password]
        
        ConnectionHelper.KSCgetDataFromJson(url: urlString, paramString: paramString) { (responce, status) in
            
            //self.activityIndicator.stopAnimating()
            
            
        }
        
    }
    
    
    @IBAction func tweeterSignup(_ sender: Any) {
    
    }
    
    
    @IBAction func facebookSignup(_ sender: Any) {
    
    }
    
    
    
    @IBAction func signIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}

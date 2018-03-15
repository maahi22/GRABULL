//
//  LoginVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    var statusLogin = 0
    @IBOutlet weak var barButtonDismiss: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtEmailMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
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

    
    
    
    
    
    @IBAction func tweeterLogin(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func facebookClick(_ sender: Any) {
        
        
        
    }
    
    
    
    @IBAction func registrationClick(_ sender: Any) {
        
        let mainStoryBoard = UIStoryboard(name: "Registration", bundle: nil)
        let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        self.navigationController?.pushViewController(ViewController, animated: true)
        
    }
    
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        
     /*   txtEmailMobile.resignFirstResponder()
        txtPassword.resignFirstResponder()
        guard
            let userName = txtEmailMobile.text, !userName.isEmpty,
            let password = txtPassword.text, !password.isEmpty
            else {
                //doneBarButton.isEnabled = false
                
                let alert = UIAlertController(title: "Alert!", message: "Please enter the login credential", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
                return
        }*/
        
        
        
     //   self.activityIndicator.startAnimating()
        
        let token = DefaultDataManager.getDeviceToken()
        let urlString = baseUrl + Api_Login
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
   //     let paramString = ["DeviceId":deviceID,"MobileNo":userName,"EmailID":userName,"Password":password,"token":token ]//,
        
      //  ConnectionHelper.KSCgetDataFromJson(url: urlString, paramString: paramString) { (responce, status) in
            
     //       self.activityIndicator.stopAnimating()
        
        //Save user id
        if statusLogin == 0{
            DefaultDataManager.saveUserId("userid")
            self.dismiss(animated: true) {
                
            }
            
        }else{
            DefaultDataManager.saveUserId("userid")
            let mainStoryBoard = UIStoryboard(name: "TabBar", bundle: nil)
            let tabController = mainStoryBoard.instantiateViewController(withIdentifier: "TabBarControl") as! TabBarControl
            tabController.navigationController?.navigationBar.barTintColor = .red
            self.present(tabController, animated: true) {
          
            }
     //       }
       //ENDED
        
        }
            
            
    }
    
    
    
    @IBAction func dismissView(_ sender: Any) {
   
        self.dismiss(animated: true) {
            
        }
    }
    
    
    
}

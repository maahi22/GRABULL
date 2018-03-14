//
//  LoginVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        
        
        DefaultDataManager.saveUserId("userid")
        
        let mainStoryBoard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabController = mainStoryBoard.instantiateViewController(withIdentifier: "TabBarControl") as! TabBarControl
        tabController.navigationController?.navigationBar.barTintColor = .red
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.window?.rootViewController = tabController
        self.present(tabController, animated: true) {
            
        }
        
    }
    
    
    
    
    
    
}

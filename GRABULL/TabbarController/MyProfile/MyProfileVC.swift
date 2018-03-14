//
//  MyProfileVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class MyProfileVC: UIViewController {

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

    
    
    @IBAction func logoutApp(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Logout!", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        self.present(alertController, animated: true, completion: nil)//Are you sure you want to logout?
        
        let yesAction:UIAlertAction  = (UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            
            
            DefaultDataManager.deleteUserId()
            
            let mainStoryBoard = UIStoryboard(name: "Login", bundle: nil)
            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let navController = UINavigationController(rootViewController: ViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navController
            
        }))
        alertController.addAction(yesAction)
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
            alertController .dismiss(animated: true, completion: nil)
        }))
        
    }
    
    
    
    
}

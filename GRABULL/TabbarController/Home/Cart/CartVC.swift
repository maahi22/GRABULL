//
//  CartVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit


private let reuseCartCell = "CartCell"

class CartVC: UIViewController {

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
    
    
    @IBAction func cancel(_ sender: Any) {
    
        self.dismiss(animated: true) {
            
        }
    
    }
    
    
    
    @IBAction func clickCheckOut(_ sender: Any) {
    
        
        let userId = DefaultDataManager.getUserId()
        if userId == "" {
            let mainStoryBoard = UIStoryboard(name: "Login", bundle: nil)
            let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
           // let navController = UINavigationController(rootViewController: viewController)
           // viewController.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
            viewController.modalPresentationStyle = .overCurrentContext
            DispatchQueue.main.async(execute: {  () -> Void  in
                
                
                let navController = UINavigationController(rootViewController: viewController)
                self.present(navController, animated: true) {
                    
                }
                
               /* guard !Bundle.main.bundlePath.hasSuffix(".appex") else {
                    return; // skip operation when embedded to App Extension
                }
                
                if let delegate = UIApplication.shared.delegate {
                    delegate.window!!.rootViewController?.present(viewController, animated: true, completion: { () -> Void in
                        // optional completion code
                    })
                }*/
            })
            
            
        }else{
            let mainStoryBoard = UIStoryboard(name: "CheckOut", bundle: nil)
            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "CheckOutVC") as! CheckOutVC
            //let navController = UINavigationController(rootViewController: ViewController)
            self.navigationController?.pushViewController(ViewController, animated: true)
            /*self.present(navController, animated: true) {
             
             }*/
        }
        
    }
    
    
}


extension CartVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 2.0
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    /*func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
        
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DeviceType.IS_IPHONE_6P {
            return 105.0
        }else{
            return 90.0
        }
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CartCell = tableView.dequeueReusableCell(withIdentifier: reuseCartCell, for: indexPath) as! CartCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
}



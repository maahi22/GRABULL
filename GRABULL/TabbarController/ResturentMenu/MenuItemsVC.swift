//
//  MenuItemsVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class MenuItemsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
       /* self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear*/
        
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

    
    /*
 
     let mainStoryBoard = UIStoryboard(name: "AddItem", bundle: nil)
     let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddItemVC") as! AddItemVC
     
     viewController.modalPresentationStyle = .overCurrentContext
     // let navController = UINavigationController(rootViewController: ViewController)
     self.present(viewController, animated: true) {
     
     }
 */
}

private let reuseCartCell = "CartCell"

extension MenuItemsVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 2.0
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
        
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
        
        let mainStoryBoard = UIStoryboard(name: "AddItem", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddItemVC") as! AddItemVC
        
        viewController.modalPresentationStyle = .overCurrentContext
       /* self.present(viewController, animated: true) {
            
        }*/
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    
}







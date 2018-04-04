//
//  EditAddress.swift
//  GRABULL
//
//  Created by Apple on 22/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class EditAddress: UIViewController {

    
    var editStatus :Bool = false
    
    @IBOutlet weak var txtHouseNo: UITextField!
    @IBOutlet weak var txtNearby: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if editStatus {
            self.title = "Edit Address"
        }else{
            self.title = "Add Address"
        }
        
        
        
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
    
    
    
    
    @IBAction func saveAddress(_ sender: Any) {
   
    
    
    }
    
    
    

}

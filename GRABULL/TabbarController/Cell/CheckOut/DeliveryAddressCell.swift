//
//  DeliveryAddressCell.swift
//  GRABULL
//
//  Created by Maahi on 04/04/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class DeliveryAddressCell: UICollectionViewCell {
    
    @IBOutlet weak var txtViewAddress: UITextView!
    @IBOutlet weak var btnDelete: UIButton!
    
    
    
    
    @IBAction func deleteAddress(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Delete!", message: "Are you Sure?", preferredStyle: UIAlertControllerStyle.actionSheet)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)//Are you sure you want to logout?
        
        let yesAction:UIAlertAction  = (UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            
            
            
            
        }))
        alertController.addAction(yesAction)
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
            alertController .dismiss(animated: true, completion: nil)
        }))
        
        
        
        
    }
    
}

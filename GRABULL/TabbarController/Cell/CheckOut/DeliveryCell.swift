//
//  DeliveryCell.swift
//  GRABULL
//
//  Created by Maahi on 18/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class DeliveryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var txtViewAddress: UITextView!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var btnDefault: UIButton!
    
    
    @IBAction func defaultChangeClick(_ sender: UIButton) {
        
      //  let tag = sender.tag
        let btn:UIButton = sender
        
        let img = UIImage(named: "radioOn")?.withRenderingMode(.alwaysTemplate)
        let imgOff = UIImage(named: "radioOff")?.withRenderingMode(.alwaysTemplate)
        
        
        if btn.imageView?.image == img{
           
            btn.setImage(imgOff, for: .normal)
        }else{
            btn.setImage(img, for: .normal)
        }
        
    }
    
    
    
}

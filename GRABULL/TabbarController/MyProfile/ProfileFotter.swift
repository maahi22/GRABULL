//
//  ProfileFotter.swift
//  GRABULL
//
//  Created by Maahi on 03/04/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

protocol ProfileFotterDelegate {
    
    func addNewAddress()
}

class ProfileFotter: UICollectionReusableView {

    
    @IBOutlet weak var lblAddAddress: UILabel!
    @IBOutlet weak var btnAddAddress: UIButton!
     var delegate:ProfileFotterDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    @IBAction func addNewAddress(_ sender: Any) {
        
        delegate?.addNewAddress()
        
    }
    
    
}

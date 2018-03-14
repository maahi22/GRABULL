//
//  UIView+CardView.swift
//  MyDunia
//
//  Created by Rajeev kumar singh on 8/11/17.
//  Copyright © 2017 TalentTrobe(India.com. All rights reserved.
//

import Foundation
import UIKit



extension UIView {
    
   /* func setCardView(view : UIView){
        
        view.layer.cornerRadius = 5.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 5.0
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor =  UIColor.darkGray.cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOffset = CGSize(width:5, height: 5)
        view.layer.masksToBounds = false
        view.clipsToBounds = false
    }*/
    
    
    
    
    func setCardView(view : UIView){
        
        layer.cornerRadius = 2
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 1)
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3);
        layer.shadowOpacity = 0.7
        layer.shadowPath = shadowPath.cgPath
    }

    
    
}

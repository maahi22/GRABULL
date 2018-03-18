//
//  CommonHelper.swift
//  GRABULL
//
//  Created by Maahi on 18/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class CommonHelper: NSObject {

     func drawTraiangleView(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        context.addLine(to: CGPoint(x: (rect.minX), y: rect.maxY))
        context.closePath()
        
        context.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.fillPath()
    }
    
    
}

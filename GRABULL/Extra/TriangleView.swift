//
//  TriangleView.swift
//  GRABULL
//
//  Created by Apple on 19/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit


//https://stackoverflow.com/questions/20461918/draw-triangle-as-subview-to-right-corner-of-table-cell
class TriangleView: UIView {

    
    //Write your code in drawRect
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.minX), y: rect.maxY))
        context.closePath()
        
        context.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.fillPath()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  UIViewExtensions.swift
//  SpaceX
//
//  Created by david on 9/6/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func round( _ radiuis:CGFloat = 10)  {
        self.layer.cornerRadius = radiuis
        self.clipsToBounds = true
    }
    
    func addBorder(color:UIColor,width:CGFloat)  {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func addShadow(shadowColor:UIColor,
                   offSet:CGSize,
                   opacity:Float,
                   shadowRadius:CGFloat,
                   cornersRadius:CGFloat,
                   corner:UIRectCorner,
                   fillColor:UIColor = .white)  {
        
        
       // let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornersRadius, height: cornersRadius)
        let cgPath = UIBezierPath(roundedRect: self.bounds,byRoundingCorners: corner,cornerRadii: size).cgPath
        self.layer.shadowPath = cgPath
//        self.layer.sh = fillColor.cgColor
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowPath = cgPath
        self.layer.shadowOffset = offSet
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
      
        
        
        
    }
    
}

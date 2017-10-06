//
//  UIUtil.swift
//  bcard
//
//  Created by Alican Karayelli on 5.10.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation
import UIKit

class UIUtil {
    
    /**
     Adds shadow with radius 3.0 and opacity 1.0 to given view
     
     - parameter view UIView instance to apply shadow
     
     - Returns:
     */
    static func addShadowToView(view:UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset =  CGSize.zero
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 3.0
        view.clipsToBounds = false
        view.layer.masksToBounds = false
    }
    
    /**
     Adds border and corner radius with radius 5.0 and borderWidth 2.0 to given view
     
     - parameter view UIView instance to apply border and corner radius
     
     - Returns:
     */
    static func addBorderAndCornerRadius(view: UIView){
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
    }
}

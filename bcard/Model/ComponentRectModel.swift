//
//  ComponentRectModel.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation
import UIKit

struct ComponentRectModel {
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var fontStyle: String
    var textColor: String

    static func convertToRectModel(coordinateDict: NSDictionary) -> ComponentRectModel{
        
        let xCoordinate = coordinateDict["x"] as! CGFloat
        let yCoordinate = coordinateDict["y"] as! CGFloat
        let width = coordinateDict["width"] as! CGFloat
        let fontStyle = coordinateDict["font"] as! String
        let textColor = coordinateDict["textColor"] as! String

        return ComponentRectModel(x: xCoordinate, y: yCoordinate, width: width, fontStyle: fontStyle, textColor: textColor)
    }
    
    func createLabel(tag: CardComponentTag, coefficient: CGFloat) -> UILabel{
        
        let label = UILabel(frame: CGRect(x: (self.x * coefficient), y: (self.y * coefficient), width: (self.width * coefficient), height: Constants.UI.cardLabelHeight))
        label.tag = tag.rawValue
        label.textColor = UIColor.init(hex: self.textColor)
        
        let styles = self.fontStyle.components(separatedBy:" ")
        if(styles.count == 2){
            label.font = UIFont(name: styles[0] , size: Double(styles[1]).map{ CGFloat($0)}!)
        }else{
            label.font = UIFont.systemFont(ofSize: 10)
        }
        
        return label
    }
}

//
//  Constants.swift
//  bcard
//
//  Created by Alican Karayelli on 4.10.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct UI {
        static let cardCellWidth: CGFloat = (UIScreen.screenWidth - 40)
        static let cardCellHeight: CGFloat = ((UI.cardCellWidth * 675) / 1125)
        static let cardLabelHeight: CGFloat = 20
    }
    
    struct DateFormats{
        static let YYYY_MM_DD = "YYYY-MM-dd"
        static let YYYYMMDD = "YYYYMMdd"
        static let DDdotMMdotYYYY = "dd.MM.YYYY"
        static let YYYY_MM_DD_HH_MM_SS = "YYYY-MM-dd(HH:mm:ss)"
        static let HHMMSS = "HHmmss"
        static let HH_MM = "HH:mm"
    }
}

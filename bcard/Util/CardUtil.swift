//
//  CardUtil.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation
import UIKit

class CardUtil {
    
    
    func createBusinessCardComponent(cell: UICollectionViewCell) {
        
        let componentStructure: [String:Any] = readJson()!
        
        let canvasWidth: CGFloat = componentStructure["canvasWidth"] as! CGFloat
        let canvasHeight: CGFloat = componentStructure["canvasHeight"] as! CGFloat

        let collectionViewCellWidth: CGFloat = cell.frame.width
        let collectionViewCellHeight: CGFloat = cell.frame.height

        let coefficient = collectionViewCellWidth / canvasWidth
        
        
        let businessCardUIModelList = parseCardComponents(componentResponse: componentStructure["components"] as! NSArray)
        
    }
    
    
    
    private func parseCardComponents(componentResponse: NSArray) -> [BusinessCardUIModel]{
        
        let response: [BusinessCardUIModel] = [BusinessCardUIModel]()
        
        
        
        

        return response
    }

    private func readJson() -> [String: Any]? {
        do {
            if let file = Bundle.main.url(forResource: "cardStructure", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    print(object)
                    return object
                } else if let object = json as? [Any] {
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
            
            return nil
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

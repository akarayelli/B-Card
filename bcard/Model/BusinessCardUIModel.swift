//
//  BusinessCardUIModel.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation


struct BusinessCardUIModel {
    
    var id: Int
    var backgroundImage: String
    var name: ComponentRectModel
    var surname: ComponentRectModel
    var address: ComponentRectModel
    var companyName: ComponentRectModel
    var email: ComponentRectModel
    var phone: ComponentRectModel
    var businessTitle: ComponentRectModel
    var city: ComponentRectModel?
    var district: ComponentRectModel?


    static func convertToUIModel(cardInfoDic: NSDictionary) -> BusinessCardUIModel{
        
        let cardID = cardInfoDic["cardId"] as! Int
        let backgroundImage = cardInfoDic["backgroundImage"] as! String
        
        // *** Coordinates ****
        let coordinates = cardInfoDic["coordinates"] as! NSDictionary
        
        let nameCoordinates = coordinates["name"] as! NSDictionary
        let nameComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: nameCoordinates)
        
        let surnameCoordinates = coordinates["surname"] as! NSDictionary
        let surnameComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: surnameCoordinates)

        let titleCoordinates = coordinates["title"] as! NSDictionary
        let titleComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: titleCoordinates)

        let phoneCoordinates = coordinates["phone"] as! NSDictionary
        let phoneComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: phoneCoordinates)

        let addressCoordinates = coordinates["address"] as! NSDictionary
        let addressComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: addressCoordinates)

        let emailCoordinates = coordinates["email"] as! NSDictionary
        let emailComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: emailCoordinates)

        let companyCoordinates = coordinates["company"] as! NSDictionary
        let companyComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: companyCoordinates)

        let cityCoordinates = coordinates["city"] as! NSDictionary
        let cityComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: cityCoordinates)

        let districtCoordinates = coordinates["district"] as! NSDictionary
        let districtComponentRectModel = ComponentRectModel.convertToRectModel(coordinateDict: districtCoordinates)

        
        return BusinessCardUIModel(id: cardID, backgroundImage: backgroundImage, name: nameComponentRectModel, surname: surnameComponentRectModel, address: addressComponentRectModel, companyName: companyComponentRectModel, email: emailComponentRectModel, phone: phoneComponentRectModel, businessTitle: titleComponentRectModel, city: cityComponentRectModel , district: districtComponentRectModel)
        
    }
}



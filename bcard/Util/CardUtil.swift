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
    
    /**
     Creates view that contains business card layout
     
     @param componentResponse json representation of card layout
     
     @return [UIView] UIView list which contains card's drawn layouts
     */
    func createBusinessCardViewWithComponent() -> [UIView] {
        
        var cardInfoViewList = [UIView]()
        
        let componentStructure: [String:Any] = readJson()!

        let canvasWidth: CGFloat = componentStructure["canvasWidth"] as! CGFloat
      //let canvasHeight: CGFloat = componentStructure["canvasHeight"] as! CGFloat
        let coefficient = Constants.UI.cardCellWidth / canvasWidth
        
        let businessCardUIModelList = parseCardComponents(componentResponse: componentStructure["components"] as! NSArray)

        for businessCardUIModel in businessCardUIModelList {

            let cardHolderView = UIView(frame: CGRect(x: 0, y: 0, width: Constants.UI.cardCellWidth, height: Constants.UI.cardCellHeight))
            cardHolderView.backgroundColor = UIColor.clear
            
            let backgroundImageView = UIImageView(frame: cardHolderView.frame)
            backgroundImageView.image =  UIImage(named: businessCardUIModel.backgroundImage)
            cardHolderView.addSubview(backgroundImageView)

            let nameLabel = businessCardUIModel.name.createLabel(tag:CardComponentTag.name , coefficient: coefficient)
            cardHolderView.addSubview(nameLabel)
            
            let surnameLabel = businessCardUIModel.surname.createLabel(tag: CardComponentTag.surname, coefficient: coefficient)
            cardHolderView.addSubview(surnameLabel)

            let addressLabel =  businessCardUIModel.address.createLabel(tag: CardComponentTag.address, coefficient: coefficient)
            cardHolderView.addSubview(addressLabel)

            let companyNameLabel = businessCardUIModel.companyName.createLabel(tag: CardComponentTag.companyName, coefficient: coefficient)
            cardHolderView.addSubview(companyNameLabel)

            let emailLabel = businessCardUIModel.email.createLabel(tag: CardComponentTag.email, coefficient: coefficient)
            cardHolderView.addSubview(emailLabel)

            let phoneLabel = businessCardUIModel.phone.createLabel(tag: CardComponentTag.phone, coefficient: coefficient)
            cardHolderView.addSubview(phoneLabel)

            let businessTitleLabel = businessCardUIModel.businessTitle.createLabel(tag: CardComponentTag.businessTitle, coefficient: coefficient)
            cardHolderView.addSubview(businessTitleLabel)

            if let cityInfo = businessCardUIModel.city {
                let cityLabel = cityInfo.createLabel(tag: CardComponentTag.city, coefficient: coefficient)
                cardHolderView.addSubview(cityLabel)
            }

            if let districtInfo = businessCardUIModel.district{
                let districtLabel = districtInfo.createLabel(tag: CardComponentTag.district, coefficient: coefficient)
                cardHolderView.addSubview(districtLabel)
            }

            cardInfoViewList.append(cardHolderView)
        }
        
        return cardInfoViewList
        
    }
    
    /**
     Converts json components to model intances
     
     @param componentResponse json representation of card layout
     
     @return [BusinessCardUIModel] model list of card layot with properties
     */
    private func parseCardComponents(componentResponse: NSArray) -> [BusinessCardUIModel]{
        
        var businessCardUIModelList: [BusinessCardUIModel] = [BusinessCardUIModel]()
        
        for cardInfoDictionary in componentResponse {
            
            let cardInfo: NSDictionary = cardInfoDictionary as! NSDictionary
            let businessCardUIModel = BusinessCardUIModel.convertToUIModel(cardInfoDic: cardInfo)
            businessCardUIModelList.append(businessCardUIModel)
        }
        return businessCardUIModelList
    }
    

    /**
     Reads json file from bundle

     @return [String: Any] dictionary representation of json file
     */
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

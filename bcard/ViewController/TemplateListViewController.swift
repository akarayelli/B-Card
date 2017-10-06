//
//  TemplateListViewController.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import UIKit
import CoreUtilFramework
import SkyFloatingLabelTextField

class TemplateListViewController: UIViewController {

    var centeredCellWidth:CGFloat = 0
    var cardInfoViewList: [UIView] = []
    
    @IBOutlet var personalView: UIView!
    @IBOutlet var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet var surnameTextField: SkyFloatingLabelTextField!
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var addressTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var businessView: UIView!
    @IBOutlet var businessTitleTextField: SkyFloatingLabelTextField!
    @IBOutlet var phoneTextField: SkyFloatingLabelTextField!
    @IBOutlet var companyNameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInfoViewList = CardUtil().createBusinessCardViewWithComponent()
        
        //register cell
        cardCollectionView!.register(UINib(nibName: CardCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.className)
        
        //make zero default collectionview content inset
        cardCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)

        UIUtil.addBorderAndCornerRadius(view: personalView)
        UIUtil.addBorderAndCornerRadius(view: businessView)
  
    }
    
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        
        log.debug("APPLY button clicked. Will set values into card layout...")
        
        for cardCollectionViewCell in self.cardCollectionView.visibleCells{
            
            let nameLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.name.rawValue) as! UILabel
            nameLabel.text = nameTextField.text! + " " + surnameTextField.text!
            let phoneLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.phone.rawValue) as! UILabel
            phoneLabel.text = phoneTextField.text
            let addressLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.address.rawValue) as! UILabel
            addressLabel.text = addressTextField.text
            let companyNameLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.companyName.rawValue) as! UILabel
            companyNameLabel.text = companyNameTextField.text
            let businessTitleLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.businessTitle.rawValue) as! UILabel
            businessTitleLabel.text = businessTitleTextField.text
            let emailLabel: UILabel = cardCollectionViewCell.viewWithTag(CardComponentTag.email.rawValue) as! UILabel
            emailLabel.text = emailTextField.text
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension TemplateListViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        log.debug("Card selected with indexpath: " +  String(describing:indexPath.row))
    }
}

extension TemplateListViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardInfoViewList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.className,for: indexPath) as! CardCollectionViewCell
        
        UIUtil.addShadowToView(view: cell)
        
        let cardView = cardInfoViewList[indexPath.row]
        cell.addSubview(cardView)
        cell.sendSubview(toBack: cardView)
        
        return cell
        
    }
    
}

extension TemplateListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let screenWidth = Constants.UI.cardCellWidth
        let desiredHeight = Constants.UI.cardCellHeight
        centeredCellWidth = screenWidth
        return CGSize(width: screenWidth  , height: desiredHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(0, 20, 0, 20);
    }
}



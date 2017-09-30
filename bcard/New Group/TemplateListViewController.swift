//
//  TemplateListViewController.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import UIKit
import CoreUtilFramework

class TemplateListViewController: UIViewController {

    var centeredCellWidth:CGFloat = 0

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register cell
        cardCollectionView!.register(UINib(nibName: CardCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.className)
        
        //make zero default collectionview content inset
        cardCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension TemplateListViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension TemplateListViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.className,for: indexPath) as! CardCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset =  CGSize.zero
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 3.0
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
        
        
        let imageName = "card" + String((indexPath.row + 1)) + "_front.png"
        cell.backgroundImage.image = UIImage(named: imageName)
        
        return cell
        
    }
}

extension TemplateListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let screenWidth = UIScreen.screenWidth - 60
        let desiredHeight = (screenWidth * 675) / 1125
        centeredCellWidth = screenWidth
        return CGSize(width: screenWidth  , height: desiredHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(0, 20, 0, 20);
    }
}



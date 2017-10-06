//
//  CenterCellCollectionViewFlowLayout.swift
//  bcard
//
//  Created by Alican Karayelli on 30.09.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//


import UIKit
class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        
        if let collectionView = collectionView,
            let first = layoutAttributesForItem(at: IndexPath(row: 0, section: 0)),
            let last = layoutAttributesForItem(at: IndexPath(row: collectionView.numberOfItems(inSection: 0) - 1, section: 0))
        {
            sectionInset = UIEdgeInsets(top: 0,
                                        left: collectionView.frame.width / 2 - first.bounds.size.width / 2,
                                        bottom: 0,
                                        right: collectionView.frame.width / 2  - last.bounds.size.width / 2)
        }
        
        
        let collectionViewSize           = self.collectionView!.bounds.size
        let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewSize.width * 0.5
        
        
        var candidateAttributes: UICollectionViewLayoutAttributes?
        for attributes in self.layoutAttributesForElements(in: self.collectionView!.bounds)! {
            
            // Skip comparison with non-cell items (headers and footers)
            if attributes.representedElementCategory != .cell {
                continue
            }
            
            
            // Don't even bother with items on opposite direction
            // You'll get at least one, or else the fallback got your back
            let currentOffset = self.collectionView!.contentOffset
            if (attributes.center.x <= (currentOffset.x + collectionViewSize.width * 0.5)
                && velocity.x > 0) || (attributes.center.x >= (currentOffset.x + collectionViewSize.width * 0.5)
                    && velocity.x < 0) {
                continue
            }
            
            
            // First good item in the loop
            if candidateAttributes == nil {
                candidateAttributes = attributes
                continue
            }
            
            // Save constants to improve readability
            let lastCenterOffset = candidateAttributes!.center.x - proposedContentOffsetCenterX
            let centerOffset = attributes.center.x - proposedContentOffsetCenterX
            
            if fabsf( Float(centerOffset) ) < fabsf( Float(lastCenterOffset) ) {
                candidateAttributes = attributes
            }
        }
        
        if candidateAttributes != nil {
            return CGPoint(x: candidateAttributes!.center.x - collectionViewSize.width * 0.5, y: proposedContentOffset.y)
        } else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        }
        
    }
    
}

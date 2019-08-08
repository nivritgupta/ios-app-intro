//
//  SwippingController+UICollectionView.swift
//  autolayout-niv
//
//  Created by Developer on 03/08/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import UIKit

extension SwipingController {
    
    //#MARK: pageControl Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        //   cell.bearImageView.image = UIImage(named: page.imageNameArray)
        //   cell.descriptionTextView.text = page.headerText
        
        
        
        //        let imageName = imageNameArry[indexPath.item]
        //
        //        cell.bearImageView.image = UIImage(named: imageName)
        //        cell.descriptionTextView.text = headerString[indexPath.item]
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green // if index path is divisible by 2 then we we set background color red otherwise it showing green color
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

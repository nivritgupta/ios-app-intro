//
//  SwippingControllerExtension.swift
//  autolayout-niv
//
//  Created by Developer on 03/08/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            
            
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }) { (_) in
            
        }
    }

}

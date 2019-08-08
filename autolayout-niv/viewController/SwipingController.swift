//
//  SwipingController.swift
//  autolayout-niv
//
//  Created by Developer on 02/08/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import UIKit

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
    
    Page(imageNameArray: "bear_first", headerText: "Join us today in our fun and games!" ,bodyText: "Are you ready for loads and loads of fun? don't wait any longer we hope to see you in our store soon",nameLabel: "Created By Nivrit"),
    Page(imageNameArray: "heart_second", headerText: "Subscribe and get coupons on our daily events!",bodyText: "Get notified of the saving immediately when we are announce then on our website! Make sure to give us any feedback you have",nameLabel: "Created By Nivrit"),
    Page(imageNameArray: "leaf_third", headerText: "VIP members special services",bodyText: " Enjoy special meals and food plans for VIP members customers",nameLabel: "Created By Nivrit")
    ]
    
    
    
        lazy var pageControl:UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
        
        
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
        
        
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
        
        
    }()
    
    @objc private func handlePrevious(){
        
        print(pageControl.currentPage)
        let nextIndex = max(pageControl.currentPage - 1, 0 )
        print(nextIndex)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        print(indexPath)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
    }

    @objc private func handleNext(){
        
        print(pageControl.currentPage)

        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1 )
        
        print(nextIndex)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        print(indexPath)
        pageControl.currentPage = nextIndex
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    
    fileprivate func setupBottomControls(){
        
        // view.addSubview(previousButton)
        
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        
        
        let bottomControlContainer = UIStackView(arrangedSubviews: [previousButton,pageControl ,nextButton])
        bottomControlContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomControlContainer.distribution = .fillEqually
        view.addSubview(bottomControlContainer)
        
        //  previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        NSLayoutConstraint.activate([
            bottomControlContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlContainer.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        print(x,view.frame.width , x / view.frame.width)
        
    }
    
    //#MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()

        
        
        collectionView?.backgroundColor = .white
        
        collectionView.isPagingEnabled = true
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    

    
}

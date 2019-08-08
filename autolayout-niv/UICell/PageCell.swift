//
//  PageCell.swift
//  autolayout-niv
//
//  Created by Developer on 02/08/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import UIKit




class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     //   backgroundColor = .purple
        UISetup()
    }
    
    var page: Page? {
        didSet {
            //print(page?.imageNameArray ?? " ")
            
        //    bearImageView.image = UIImage(named: page?.imageNameArray ?? " ")  // first option

            guard let unrappedPage = page else {return}
            bearImageView.image = UIImage(named: unrappedPage.imageNameArray)  // second option
            
            let attributedText = NSMutableAttributedString(string: unrappedPage.headerText , attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
              attributedText.append(NSAttributedString(string: "\n\n\n \(unrappedPage.bodyText),\n\n\n \(unrappedPage.nameLabel)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
         

        }
    }
    
    
  private  let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // enable autolayout
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
  private  let descriptionTextView: UITextView = {
        var textView = UITextView()
        //  textView.text = "Join us today in our fun and games!"
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
      //  attributedText.append(NSAttributedString(string: "\n\n\n\nAre you ready for loads and loads of fun? don't wait any longer we hope to see you in our store soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        textView.attributedText = attributedText
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
        
    }()
    
    
    private  let nameLabel: UITextView = {
        var textView = UITextView()
        //  textView.text = "Join us today in our fun and games!"
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        //  attributedText.append(NSAttributedString(string: "\n\n\n\nAre you ready for loads and loads of fun? don't wait any longer we hope to see you in our store soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        textView.attributedText = attributedText
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
        
    }()
    

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private  func UISetup(){
        
        
        // Setup UI of the cell 
        
        let topContainerView = UIView()
        addSubview(topContainerView)
        addSubview(descriptionTextView)
        addSubview(nameLabel)
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
      
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    
    
}

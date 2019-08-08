//
//  ViewController.swift
//  autolayout-niv
//
//  Created by Developer on 01/08/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainPink = UIColor(displayP3Red: 233/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        // enable autolayout
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView

    }()
    
    let descriptionTextView: UITextView = {
        var textView = UITextView()
      //  textView.text = "Join us today in our fun and games!"
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n\nAre you ready for loads and loads of fun? don't wait any longer we hope to see you in our store soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
      //  textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
        
    }()
    
    
    private let pageControl:UIPageControl = {
    
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
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
        return button
        
        
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
        
    }()
    
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   // view.backgroundColor = .yellow
        
        view.addSubview(descriptionTextView)
      //  view.addSubview(descriptionTextView1)

        UISetup()
        setupBottomControls()
        

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

    
  private  func UISetup(){
    
    
    // add container
    
    let topContainerView = UIView()
    view.addSubview(topContainerView)

    topContainerView.translatesAutoresizingMaskIntoConstraints = false
    topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

    topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    topContainerView.addSubview(bearImageView)
    bearImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
    bearImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
    bearImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true

    
    
    descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    

    }

    
    

}


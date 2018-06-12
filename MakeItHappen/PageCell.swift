//
//  PageCell.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/7/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//
//THIS CLASS IS THE COSTUM CELLS IN THE GOLACONTROLLER CLASS

import UIKit

protocol PopupModalDelegate {
    func didPressMenuButton(allGoalsView: UINavigationController)
}
class PageCell: UICollectionViewCell{
    
    var delegate: PopupModalDelegate?
    
    var goal: Goal? {
        didSet{
            guard let unWrappedGoal = goal else {return}
            let attributedText = NSMutableAttributedString(string: unWrappedGoal.goalName, attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\(unWrappedGoal.goalDescription)", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.gray]))
            attributedText.append(NSMutableAttributedString(string: "\n\n\(unWrappedGoal.accoplishDate)", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.blue]))
            goalTextView.attributedText = attributedText
            goalTextView.textAlignment = .left
            
        }
    }
    
    
    //set the bacground image
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Workout"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //menubutton
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        button.addTarget(self, action: #selector(handleMenuAction), for: .touchUpInside)
        //TODO: add target and selector for button
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    
    }()
    
    //goal name
    let goalTextView: UITextView = {
        let view = UITextView()
        view.textAlignment = .left
        view.isEditable = false
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
        
    }()
    
    @objc func handleMenuAction(){
        print("Attemting to open menu")
//        self.delegate?.didPressMunuButton()
        let modal = AllGoalsView()
        let navContraoller = UINavigationController(rootViewController: modal)
        self.delegate?.didPressMenuButton(allGoalsView: navContraoller)
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundImageConstraints()
        setupUI()
        backgroundColor = .purple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //the the backgound image constraints
    func backgroundImageConstraints(){
        addSubview(backgroundImage)
        backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func setupUI(){
        addSubview(menuButton)
        // TODO: make contraints for the button
        addSubview(goalTextView)
        goalTextView.topAnchor.constraint(equalTo: topAnchor, constant: 620).isActive = true
        goalTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        goalTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        goalTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}

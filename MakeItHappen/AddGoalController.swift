//
//  AddGoalController.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/12/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class AddGaolController: UIViewController {
    
    let selectBackgroundImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "no-image-icon-13"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image

    }()
    let goalTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Goal"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let goalLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your goal for this year ?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        setupUi()
    }
    
    
    func setupUi(){

        view.addSubview(selectBackgroundImage);
        selectBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selectBackgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectBackgroundImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        selectBackgroundImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
       
//        view.addSubview(goalLabel)
//        goalLabel.topAnchor.constraint(equalTo: selectBackgroundImage.bottomAnchor, constant: -300).isActive = true
//        goalLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        goalLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        goalLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(goalTextField)
        goalTextField.topAnchor.constraint(equalTo: goalLabel.bottomAnchor).isActive = true
        goalTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        goalTextField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        goalTextField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
}

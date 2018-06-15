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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let purposeLabel: UILabel = {
        let label = UILabel()
        label.text = "Why do you want to achevive this goal?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let purposeTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Enter your purpose here"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let accplishDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Set an accomplish date?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectPhoto: UIButton =  {
        let button = UIButton()
        button.setTitle("Select Photo", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = .date
        return dp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        setupUi()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cancelIcon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "save").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSave))
    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSave(){
        print("attempting to save")
        guard let goalNameText = goalTextField.text else {return}
        guard let goalPurposeText = purposeTextField.text else {return}
        if goalNameText.isEmpty{
            showError(title: "No Goal", message: "Please enter a goal")
            
        }
        
        if goalPurposeText.isEmpty{
            showError(title: "No Purpose", message: "No purpose ")
        }
        
        let tuple = CoreDataManager.shared.saveGoals(goalName: goalNameText, purpose: goalPurposeText, accompishDate: datePicker.date)
        
        print("Save Completed")
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func showError(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    func setupUi(){

        view.addSubview(selectBackgroundImage);
        selectBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selectBackgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectBackgroundImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        selectBackgroundImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        view.addSubview(selectPhoto)
        selectPhoto.topAnchor.constraint(equalTo: selectBackgroundImage.bottomAnchor).isActive = true
        selectPhoto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        selectPhoto.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        selectPhoto.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
        view.addSubview(goalLabel)
        goalLabel.topAnchor.constraint(equalTo: selectPhoto.bottomAnchor, constant: 10).isActive = true
        goalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        goalTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        goalLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(goalTextField)
        goalTextField.topAnchor.constraint(equalTo: goalLabel.bottomAnchor).isActive = true
        goalTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        goalTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        goalTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(purposeLabel)
        purposeLabel.topAnchor.constraint(equalTo: goalTextField.bottomAnchor).isActive = true
        purposeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        purposeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        purposeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(purposeTextField)
        purposeTextField.topAnchor.constraint(equalTo: purposeLabel.bottomAnchor).isActive = true
        purposeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        purposeTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        purposeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(accplishDateLabel)
        accplishDateLabel.topAnchor.constraint(equalTo: purposeTextField.bottomAnchor).isActive = true
        accplishDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        accplishDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        accplishDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(datePicker)
        datePicker.topAnchor.constraint(equalTo: accplishDateLabel.bottomAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
}

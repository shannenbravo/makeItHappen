//
//  AllGoalsView.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/11/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit
class AllGoalsView: UITableViewController {
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavbar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        return label
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Hello World!"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    @objc func handelCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handelAdd(){
        print("opening add modal")
        let modal = AddGaolController()
        let navController = CostumNavigationBar(rootViewController: modal)
        present(navController, animated: true, completion: nil)
    }
    
    func setupNavbar(){
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCancel))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "filled-cancel 2").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handelCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "addIcon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handelAdd))
        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationController?.navigationBar.isTranslucent = true
    }
}

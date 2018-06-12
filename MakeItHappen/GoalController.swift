//
//  ViewController.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/6/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit


class GoalController: UICollectionViewController, UICollectionViewDelegateFlowLayout, PopupModalDelegate  {
    func didPressMenuButton(allGoalsView: UINavigationController) {
        present(allGoalsView, animated: true, completion: nil)
    }
    
 
    

    let goals = [
        Goal(goalName: "Lose 20 pounds", goalDescription: "Lose 20 pounds and run a 3k marathon", accoplishDate: "October 13, 2018"),
        Goal(goalName: "Get a scholarship ot GHC", goalDescription: "Allows me to connect with comapnies that I want to work for", accoplishDate: "September 12,2019"),
        Goal(goalName: "Get a job offer from spaceX", goalDescription: "I love working in space itelligence", accoplishDate: "May 15, 2019")
    ]

    let cellId = "CellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        //set collection view bg color
        collectionView?.backgroundColor = .green
        //regester cellcustom cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        //make paging enabled
        collectionView?.isPagingEnabled = true
        
    }
    
    //return the number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goals.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //deque cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let cellGoal = goals[indexPath.item]
        cell.delegate = self
        cell.goal = cellGoal
        return cell
    }
    
    //make the size of the cell as big as teh screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    
    }
    
    //reduce teh spacing of the cells to zero
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }


}


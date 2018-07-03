//
//  ViewController.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/6/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit
import CoreData

protocol GoalsDelegate {
    func didSetGoal(goal: Goals)
}


class GoalController: UICollectionViewController, UICollectionViewDelegateFlowLayout, PopupModalDelegate  {
    func didPressMenuButton(allGoalsView: UINavigationController) {
        present(allGoalsView, animated: true, completion: nil)
    }
    
    
    //goal Array
    var allGoals = [Goals]()
    var goalDelegate: GoalsDelegate?
    
    private func fetchData(){
        let context = CoreDataManager.shared.persistantContainer.viewContext
        let fetchRequest = NSFetchRequest<Goals>(entityName: "Goals")
        do{
            let goals = try context.fetch(fetchRequest)
            allGoals = goals
            self.collectionView?.reloadData()
            print(allGoals.count)
        }catch let fetchErr{
            print("Falied to fetch data \(fetchErr)")
        }
    }
    
    

    let cellId = "CellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        //set collection view bg color
        collectionView?.backgroundColor = .green
        //regester cellcustom cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        //make paging enabled
        collectionView?.isPagingEnabled = true
        fetchData()
        
    }
    
    //return the number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allGoals.count
//        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //deque cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let cellGoal = allGoals[indexPath.item]
        self.goalDelegate?.didSetGoal(goal: cellGoal)
        cell.goal = cellGoal
        cell.delegate = self
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


//
//  CoreDataManager.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/15/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MakeItHappenCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err {
                fatalError("Loading Stror failed \(err)")
            }
        })
        
        return container
    }()
    
    func saveGoals(goalName: String, purpose: String, accompishDate: Date) -> (Goals?, Error?) {
        let context = persistantContainer.viewContext
        let myGoal = NSEntityDescription.insertNewObject(forEntityName: "Goals", into: context) as! Goals
        myGoal.goalName = goalName
        myGoal.reason = purpose
        myGoal.accompishDate = accompishDate
        
        do{
            try context.save()
            return (myGoal,nil)
        }catch let err {
            print("Failed To Create Goal", err)
            return(nil,err)
        }
    }
}

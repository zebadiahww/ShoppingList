//
//  ListController.swift
//  ShoppingList
//
//  Created by Zebadiah Watson on 9/27/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import CoreData

class ListController {
    
    //shared instance
    static let shared = ListController()
    
    //NSFetchResultsController
    var fetchResultsController: NSFetchedResultsController<Item>
    
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: false)]
        
        let resultsController: NSFetchedResultsController<Item> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        fetchResultsController = resultsController
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch! \(error.localizedDescription)")
            
        }
    }
    
    //Create
    func createItem(itemName: String, isComplete: Bool) {
        _ = Item(itemName: itemName, isComplete: isComplete)
        saveToPersistentStore()
    }
    //Delete
    func deleteItem(item: Item) {
        CoreDataStack.context.delete(item)
        saveToPersistentStore()
    }
    
    func toggleIsComplete(item: Item) {
        item.isComplete = !item.isComplete
        saveToPersistentStore()
    }
    
    //Persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There as an error saving Objects!! \(error.localizedDescription)")
        }
    }
} // End of Class


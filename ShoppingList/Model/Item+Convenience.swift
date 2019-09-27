//
//  Item+Convenience.swift
//  ShoppingList
//
//  Created by Zebadiah Watson on 9/27/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    convenience init(itemName: String, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.itemName = itemName
        self.isComplete = isComplete
    }
}


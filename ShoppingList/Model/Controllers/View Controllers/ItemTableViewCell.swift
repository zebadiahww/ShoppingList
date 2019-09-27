//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Zebadiah Watson on 9/27/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

protocol ItemTableViewCellDelegate: class {
    func buttonTapped(sender: ItemTableViewCell)
}
class ItemTableViewCell: UITableViewCell {
    
    var delegate: ItemTableViewCellDelegate?
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func updateWith(item: Item) {
        itemText.text = item.itemName
        updateButton(item.isComplete)
    }
    
    //Outlets
    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    
    //Actions
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.buttonTapped(sender: self)
    }
} // End Of Class

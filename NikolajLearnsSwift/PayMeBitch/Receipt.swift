//
//  Receipt.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 12/08/2026.
//

import Foundation

struct Receipt {
    var itemList: [ReceiptItem] = [
        ReceiptItem(itemName: "Eggs", itemPrice: 24.95),
        ReceiptItem(itemName: "Milk", itemPrice: 5.95),
        ReceiptItem(itemName: "Honey", itemPrice: 11.95),
    ]
    
    mutating func removeItem(
        withID itemID: UUID
    ) {
        itemList.removeAll{ $0.id == itemID }
    }
    
    mutating func updateItem(
        withID itemID: UUID,
        withName name: String,
        withPrice price: Double
    ) {
        if let index = itemList.firstIndex(where: { $0.id == itemID }) {
                itemList[index].itemName = name
                itemList[index].itemPrice = price
            }
    }
    
    func approveReceipt() -> Bool {
        for item in itemList {
            if (item.itemName == "" || item.itemPrice == 0.0){
                return false
            }
        }
        
        return true && !itemList.isEmpty
    }
}

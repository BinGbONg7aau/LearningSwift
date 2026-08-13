//
//  ReceiptItem.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 12/08/2026.
//

import Foundation

struct ReceiptItem: Identifiable {
    let id = UUID()
    
    var itemName: String;
    var itemPrice: Double;
}

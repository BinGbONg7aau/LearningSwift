//
//  Player.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 05/07/2026.
//
import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String = ""
    var score: Int = 0
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}

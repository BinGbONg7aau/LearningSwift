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

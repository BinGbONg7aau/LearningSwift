//
//  ContentView.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 02/07/2026.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView{
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
            
    }
}

#Preview {
    ContentView()
}

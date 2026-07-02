//
//  WelcomePage.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 02/07/2026.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                Image(systemName: "person.and.arrow.left.and.arrow.right.outward")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
            }
            
            Text("Welcome to My App!")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Description Text")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}

//
//  DiceView.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 05/07/2026.
//

import SwiftUI

struct DiceView2: View {
    @State private var numberOfDie: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDie, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDie -= 1
                    }
                }
                .disabled(numberOfDie == 1)
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDie += 1
                    }
                }
                .disabled(numberOfDie > 4)
            }
            .padding()
            .font(.title)
            .labelStyle(.iconOnly)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.diceAppBackground)
        .tint(.white)
        
    }
}

#Preview {
    DiceView2()
}

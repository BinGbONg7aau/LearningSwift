//
//  MyView.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 02/07/2026.
//

import SwiftUI

struct MyViev: View {
    let helloFont: Font
    
    
    var body: some View {
        Text("Hello, World!")
            .font(helloFont)
        Text("Tihi!")
    }
}

#Preview {
    MyViev(helloFont: .title)
}

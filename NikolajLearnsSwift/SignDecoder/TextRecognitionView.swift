//
//  TextRecognitionView.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 13/08/2026.
//

import SwiftUI

struct TextRecognitionView: View {
    let imageResource: ImageResource
    @State private var textRecognizer: TextRecognizer?
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
            Spacer()
            
            TranslationView(text: textRecognizer?.recognizedText ?? "")
        }
        .navigationTitle("Sign Info")
        .padding()
    }
}

#Preview {
    TextRecognitionView(imageResource: .sign1).navigationBarTitleDisplayMode(.inline)
}

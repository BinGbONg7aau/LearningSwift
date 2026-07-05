//
//  DynamicView.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 05/07/2026.
//

import SwiftUI

struct DynamicView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.3.sequence.fill")
                .foregroundStyle(.tint)
                .symbolRenderingMode(.hierarchical)
            Text("Pick-a-Pal")
        }
        .font(.title)
        .bold()
        
        VStack {
            Text(pickedName.isEmpty ? "" : "\(pickedName)")
                .font(.headline)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                        .onTapGesture {
                            pickedName = name
                        }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add a name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle ("Remove Picked Name", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == pickedName)
                        }
                    }
                    
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    DynamicView()
}

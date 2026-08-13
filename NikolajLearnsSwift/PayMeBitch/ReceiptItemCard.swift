//
//  ReceiptItemCard.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 12/08/2026.
//

import SwiftUI

struct ReceiptItemCard: View {
    @Binding var receipt: Receipt
    @Binding var item: ReceiptItem
    @Binding var canExpandItemCard: Bool
    @State private var isExpanded: Bool = false
    
    var body: some View {
        if (!isExpanded) { // Design in unexpanded state
            Button {
                withAnimation {
                    if(canExpandItemCard) {
                        isExpanded = true
                        canExpandItemCard = false
                    }
                }
            } label: {
                HStack {
                    HStack{
                        Text("\(item.itemName)")
                            .padding()
                        Spacer()
                        Text(item.itemPrice, format: .currency(code: "DKK"))
                            .padding()
                        
                        Image(systemName: "pencil")
                            .padding(.trailing)
                    }
                    .background(Color.red, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
                }
            }
        } else { // Design in expanded state
            VStack{
                HStack{
                    TextField("Item Name", text: $item.itemName)
                        .disableAutocorrection(true)
                        .padding()
                    
                    Spacer()
                    TextField("Pris", value: $item.itemPrice, format: .currency(code: "DKK"))
                        .keyboardType(.decimalPad)
                        .padding()
                }
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Button("", systemImage:"trash.fill"){
                        withAnimation{
                            receipt.removeItem(withID: item.id)
                            isExpanded = false
                            canExpandItemCard = true
                        }
                    }
                    Spacer()
                    Button("", systemImage: "checkmark.circle.fill"){
                        withAnimation {
                            isExpanded = false
                            canExpandItemCard = true
                        }
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .background(Color.red, in: RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .font(.title)
            .foregroundStyle(.white)
            .bold()
        }
    }
}

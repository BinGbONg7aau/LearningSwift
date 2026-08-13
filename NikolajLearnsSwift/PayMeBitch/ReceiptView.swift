//
//  ReceiptItem.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 12/08/2026.
//

import SwiftUI

struct ReceiptView: View {
    @State private var receipt = Receipt()
    private var originalReceipt = Receipt()
    @State private var showError: Bool = false
    @State var canExpandItemCard: Bool = true
    
    var body: some View {
        Text("Please verify the receipt:")
            .font(.title)
            .bold()
        
        //Receipt item list
        ScrollView{
            VStack {
                ForEach($receipt.itemList) { $item in
                    ReceiptItemCard(receipt: $receipt, item: $item, canExpandItemCard: $canExpandItemCard)
                }
            }
        }
        
        //Add item button
        Button {
            receipt.itemList.append(ReceiptItem(itemName: "", itemPrice: 0.0))
        } label: {
            Text("Add item")
            Image(systemName: "plus.circle.fill")
        }
        .bold()
        .font(.largeTitle)
        
        //Revert and continue buttons
        HStack {
            Spacer()
            Button {
                withAnimation{
                    receipt = originalReceipt
                }
            } label: {
                HStack {
                    Text("Revert")
                    Image(systemName: "arrow.counterclockwise")
                }
                .frame(maxWidth: .infinity, minHeight: 50)
            }
            
            Button {
                if (!receipt.approveReceipt()){
                    showError = true
                } else {
                    //TODO Go to next page
                }
            } label: {
                HStack {
                    Text("Continue")
                    Image(systemName: "arrowshape.right")
                }
                .frame(maxWidth: .infinity, minHeight: 50)
            }
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Error with receipt items"),
                    message: Text("Please verify that the item's price are greater than 0,00 and the item's names are not empty")
                )
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .bold()
        .font(.title2)
        
    }
}

#Preview {
    ReceiptView()
}

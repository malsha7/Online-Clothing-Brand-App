//
//  CartItemView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

struct CartItemView: View {
    @State var item : CartItem
    var onCartCountValueChanged: () -> ()
    
    var body: some View {
        ZStack{
            HStack(spacing: 20){
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 120, height: 133)
                    .background(Image(item.product.images[0])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 130)
                    )
                VStack(alignment: .leading){
                    Text("\(item.product.title)")
                        .font(Font.custom("KumbhSans", size: 14))
                        .foregroundColor(Color.brown)
                    
                    HStack(spacing: 20){
                        Button{
                            item.count -= 1
                            if item.count < 0{
                                item.count = 0
                            }
                            
                            onCartCountValueChanged()
                            
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .overlay {
                                    Image(systemName: "minus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .tint(.brown)
                                        .frame(width: 14, height: 14)
                                }
                        }
                        .frame(width: 24, height: 24)
                        
                        Text("\(item.count)")
                            .font(Font.custom("KumbhSans", size: 24))
                            .foregroundColor(.brown)
                        
                        Button{
                            item.count += 1
                           
                            
                            onCartCountValueChanged()
                            
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .overlay {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .tint(.brown)
                                        .frame(width: 14, height: 14)
                                }
                        }
                        .frame(width: 24, height: 24)
                        Spacer()
                    }
                }
            }
        }
    }
}


#Preview {
    CartItemView(item: .init(product: product1, count: 1)){
        
    }
}

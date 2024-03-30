//
//  ProductItemView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct ProductItemView: View {
    var product : Product
    
    var body: some View {
        
        
            
            Button{
                
            } label: {
                VStack{
                Image(product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 250)
                    .cornerRadius(5)
                    .shadow(radius: 1)
                
                Text(product.title)
                    .font(Font.custom("KumbhSans", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.brown)
                    .frame(width: 167, alignment: .top)
                
                Text("$\(product.price)")
                    .font(Font.custom("KumbhSans", size: 14))
                    .foregroundColor(Color.brown)
                    .padding(.top,2)
            }
          
        }
    }
}

#Preview {
    ProductItemView(product: product1)
}

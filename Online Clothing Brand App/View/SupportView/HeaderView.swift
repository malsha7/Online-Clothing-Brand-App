//
//  HeaderView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct HeaderView: View {
    var menuAction: ButtonAction
    var cartAction: ButtonAction
    
    var body: some View {
        ZStack{
            HStack{
                Button{
                    menuAction()
                } label: {
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                
                Image("Feminine Black Purple Brand Fashion Logo-2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                Button{
                    cartAction()
                } label: {
                    Image("shopping bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(height: 80)
        .background(.white)
        .zIndex(1)
        .shadow(radius: 0.4)
    }
}


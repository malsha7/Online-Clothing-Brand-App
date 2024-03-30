//
//  ProductsList.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

struct ProductsList: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("Products")
                            .font(Font.custom("KumbhSans", size: 16))
                            .foregroundColor(.brown)
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.vertical) {
                        VStack {
                            ScrollView(.vertical) {
                                LazyVGrid(columns: adaptiveColumns) {
                                    ForEach(0..<6, id: \.self) { i in
                                        ProductItemView(product: products.randomElement()!)
                                    }
                                    
                                }
                            }
                            .scrollIndicators(.hidden)
                        }.padding([.leading, .trailing], 20)
                        FooterView()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top, 72)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    presentSideCart.toggle()
                }
            }
            
            SideMenu()
            SideCart()
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart)), direction: .trailing)
    }
    
}


#Preview {
    ProductsList()
}

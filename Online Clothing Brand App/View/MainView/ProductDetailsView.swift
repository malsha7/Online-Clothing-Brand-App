//
//  ProductDetailsView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var product: Product
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        TabView {
                            ForEach(0..<product.images.count, id: \.self) { i in
                                
                                Image(product.images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 500)
                                    .clipped()
                                
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 500)
                        .padding([.leading, .trailing], 20)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(product.title)
                                    .font(Font.custom("KumbhSans", size: 20))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.Default)
                                Spacer()
                                Image("icons8-export-96")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                            }
                            
                            Text("$\(product.price)")
                                .font(Font.custom("KumbhSans", size: 24))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.Default)
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 20)
                        
                        Text("Description")
                            .font(Font.custom("KumbhSansf", size: 18))
                            .foregroundColor(.Default)
                            .padding(.top, 20)
                        
                        Text("\(product.description)")
                            .font(Font.custom("KumbhSans", size: 18))
                            .foregroundColor(.Default)
                            .padding(.top, 3)
                            .padding([.leading, .trailing], 20)
                        
                        Text("You may also like")
                            .font(Font.custom("RobotoSerif", size: 22))
                            .foregroundColor(.Default)
                            .padding(.top, 20)
                        
                        Image("Divide")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.top, 10)
                        
                        VStack {
                            HStack(alignment: .top) {
                                ProductItemView(product: product1)
                                ProductItemView(product: product1)
                            }
                            
                            HStack(alignment: .top) {
                                ProductItemView(product: product1)
                                ProductItemView(product: product1)
                            }
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text("Explore More")
                                    .font(Font.custom("KumbhSans", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.Default)
                                
                                Image(systemName: "arrow.forward")
                                    .frame(width: 18, height: 18)
                                
                            }
                            .padding(12)
                            
                        }
                        FooterView()
                    }
                }
                .padding(.top, 56)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    presentSideCart.toggle()
                }
            }
            .overlay(alignment: .bottom) {
                ZStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .colorInvert()
                            
                            Text("Add to Basket")
                                .font(Font.custom("RobotoSerif", size: 20))
                                .kerning(0.14)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("icons8-heart-100")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
//                                .colorInvert()
                            
                        }
                        .padding([.leading, .trailing], 24)
                    }

                }
                .frame(height: 66)
                .frame(maxWidth: .infinity)
                .background(.brown)
            }
            
            SideMenu()
            SideCart()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
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
    ProductDetailsView(product : product1)
}

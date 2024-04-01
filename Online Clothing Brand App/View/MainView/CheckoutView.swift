//
//  CheckoutView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

struct CheckoutView: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        ZStack {
            MainCartView()
            //PaymentSuccessView()
        }
        .onAppear{
            updateCartValue()
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func MainCartView() -> some View {
        Color.white.edgesIgnoringSafeArea(.all)
        ZStack {
            VStack(spacing: 0) {
                Text("Checkout")
                    .font(Font.custom("KumbhSans", size: 24))
                    .kerning(4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brown)
                .frame(height: 32, alignment: .center)
                
                Image("Divide")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .padding(.top, 5)
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<cartItems.count, id: \.self) { i in
                            
                            if cartItems[i].count > 0 {
                                CartItemView(item: cartItems[i]) {
                                    updateCartValue()
                                }
                            }
                            
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 343, height: 1)
//                        .background(Color.darkBlue)
//
//                    Button {
//
//                    } label: {
//                        HStack {
//                            Image ("Voucher")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 27, height: 27)
//
//                            Text("Add promo code")
//                                .font(Font.custom("RobotoSerif", size: 19))
//                                .foregroundColor(Color.Default)
//                        }
//                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 1)
                        .background(Color.brown)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image ("icons8-deliver-100")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                            
                            Text("Delivery")
                                .font(Font.custom("KumbhSans", size: 19))
                                .foregroundColor(Color.brown)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.Default)

                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Text(" Total Amount")
                        .font(Font.custom("KumbhSans", size: 24))
                        .kerning(2)
                        .foregroundColor(.brown)
                    
                    Spacer()
                    
                    Text("$\(totalPrice)")
                        .font(Font.custom("KumbhSans", size: 16))
                        .foregroundColor(Color.Default)
                    
                }
                .padding([.leading, .trailing], 20)
                .frame(height: 50)
                
                Button {
                    
                } label: {
                    HStack {
                        Image("shopping bag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
//                            .colorInvert()
                        
                        Text("Place Order")
                            .font(Font.custom("KumbhSans", size: 16))
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(Color.brown)
                }
            }
            .padding(.top, 76)
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
//      PaymentSuccessView()
    }
    
    @ViewBuilder
    private func PaymentSuccessView() -> some View {
        ZStack {
            Color.brown.opacity(0.91).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Payment Success")
                    .font(Font.custom("KumbhSans", size: 20))
                    .kerning(4)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Image("shopping bag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    
                Text("Your payment was success")
                    .font(Font.custom("KumbhSans", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Default)
                
                Text("Payment ID \(123456)")
                    .font(Font.custom("KumbhSans", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                
                NavigationLink {
                    HomeView()
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Text("Back Home")
                            .font(Font.custom("KumbhSans", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay {
                        Rectangle()
                            .inset(by: 0.5)
                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                    }
                    .padding([.top, .bottom], 20)
                }

                
                
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .padding([.leading, .trailing], 16)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart)), direction: .trailing)
    }
    
    func updateCartValue() {
        print("\(totalPrice)")
        var value: Int = 0
        for item in cartItems {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
}

#Preview {
    CheckoutView()
}

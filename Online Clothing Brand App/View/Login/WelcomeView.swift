//
//  WelcomeView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("clothing app new")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            VStack{
                Spacer()
                
                Image("Feminine Black Purple Brand Fashion Logo-2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                    .opacity(0.78)
                    .padding(.bottom, 15)
                Text("Welcome  MyView Store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                
                Text("All Things Become Your Choice")
                    .font(.customfont(.regular, fontSize: 20))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink{
                    SignInView()
                } label: {
                RoundButton(title: "Get Started"){
                    
                    }
                }
                
               
               
                
                Spacer()
                    .frame(height: 100)
                
                
            }
            .padding(.horizontal , 20)
                
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        WelcomeView()
    }
   
}

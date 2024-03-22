//
//  SignInView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack{
            VStack{
            
            Image(systemName: "bird")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
            
          
                Spacer()
            }
               
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}

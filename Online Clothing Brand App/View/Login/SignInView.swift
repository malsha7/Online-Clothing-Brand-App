//
//  SignInView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

struct SignInView: View {
  
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var signInVM = SignInViewModel()
   
    var body: some View {
       
        ZStack{
            
            Image( "login")
                .resizable()
                .scaledToFill()
                .opacity(0.65)
                .frame(width: 80, height:.screenHeight)
            
            VStack{
                
              
                Image(systemName: "cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.bottom,  .screenWidth * 0.05)
                
                Spacer()
                    .frame(height: .screenWidth * 0.08)
                
                Text("SignIn")
                    .font(.customfont(.medium, fontSize: 30))
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,  .screenWidth * 0.08)
                
                Text("Enter Email and Password")
                    .font(.customfont(.medium, fontSize: 20))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,  .screenWidth * 0.02)
                

                LineTextField(title: "Email",placholder: "Enter Email", txt: $signInVM.email, keyboardType: .emailAddress)
                    .padding(20)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .padding()
               
                 
                    .padding(.bottom, .screenWidth * 0.01)
                
                LineTextField(title: "Password",placholder: "Enter Password", txt: $signInVM.password, keyboardType: .namePhonePad)
                    .padding(20)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .padding()
                
                    .padding(.bottom, .screenWidth * 0.04)
                    
                
                RoundButton(title: "Sign In") {
                   
                }
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.bottom, .screenWidth * 0.04)
                
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack{
                        Text("Don't have a account?")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.primaryText)
                        
                        Text("SignUp")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.white)
                    }
                }
             
               
//                Spacer()
            }
//            .padding(.top, 90)
//            .padding(.top, 50)
//            .padding(.bottom, 90)
//            
            
            VStack{
                
                Spacer()
                
                
            }
            .padding(.top, 80)
            .padding(.top, 20)
            .padding(.bottom, 80)
            
            
        }
      
        
       
        .background(Color.brown)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        SignInView()
    }
}

//
//  SignInView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

struct SignInView: View {
  
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isValidEmail: Bool = true
    @State private var isValidPassword: Bool = true
    @State private var signUpSuccess: Bool = false
    
    var body: some View {
       
        ZStack{
            
            Image( "login")
                .resizable()
                .scaledToFill()
                .opacity(0.65)
                .frame(width: 80, height:.screenHeight)
            
            VStack{
                
              
                Image("Feminine Black Purple Brand Fashion Logo-2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .cornerRadius(20)
                    .opacity(0.78)
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
                

                // Email text field
                TextField("Enter Email", text: $email)
                    .frame(width: 300)
                    .padding(20)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(20)
                    .padding(.bottom, .screenWidth * 0.04)
                    .border(Color.red, width: isValidEmail ? 0 : 1) // Border color changes if email is invalid
                
                if !isValidEmail
                {
                    Text("Invalid Email Format")
                    .foregroundColor(.red)
                                }
                
                // Password text field
                SecureField("Enter Password", text: $password)
                    .frame(width: 300)
                    .padding(20)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(20)
                    .padding(.bottom, .screenWidth * 0.04)
                    .border(Color.red, width: isValidPassword ? 0 : 1) // Border color changes if password is invalid
                
                if !isValidPassword
                {
                    Text("Password must contain Lowercase, Special character, Uppercase, Numbers")
                    .foregroundColor(.red)
                                }
                    
                
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

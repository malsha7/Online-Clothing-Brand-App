//
//  SignUpView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-27.
//

import SwiftUI

struct SignUpView: View {
          
@State private var signInVM = SignInViewModel()
        
        @Environment(\.presentationMode) var mode: Binding<PresentationMode>
      
        
        var body: some View {
         
            ZStack {
                
                Image( "login")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.35)
                    .frame(width: 80, height: .screenHeight)
                
               
                VStack{
                    
                    
                    Spacer()
                    
                    Image(systemName: "cat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom, .screenWidth * 0.1)
                  
                    
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 28))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 10)
                    
                    Text("Enter your emails and password")
                        .font(.customfont(.semibold, fontSize: 20))
                        
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    TextField("Enter Email", text: $signInVM.email)
                        .padding(20)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(20)
                    
                        .padding(.bottom, .screenWidth * 0.04)
                    
                    TextField("Enter Password", text: $signInVM.email)
                        .padding(20)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(20)
    //                EntryField(sfSymbolName: "envelope", placeHolder: "Email", prompt: signupVM.emailPrompt, field: $signupVM.email)
                    
                        .padding(.bottom, .screenWidth * 0.04)
                   
                    TextField("Confirm Password", text: $signInVM.email)
                        .padding(20)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(20)
                    
                        .padding(.bottom, .screenWidth * 0.04)
                    
                    RoundButton(title: "Sign Up") {
                     
                    }
                    .padding(.bottom, .screenWidth * 0.04)
                    
                    
                    NavigationLink {
                        SignInView()
                    } label: {
                        HStack{
                            Text("Already have a account?")
                                .font(.customfont(.semibold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                            Text("Sign In")
                                .font(.customfont(.semibold, fontSize: 20))
                                .foregroundColor(.white)
                        }
                    }

                   
                    
                    Spacer()
                }
    //            .padding(.top, .topInsets + 64)
    //            .padding(.horizontal, 20)
    //            .padding(.bottom, .bottomInsets)
    //
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                
                VStack {
                        

                    
                    Spacer()
                    
                }
    //            .padding(.top, .topInsets)
                .padding(.top, 60)
                .padding(.horizontal, 20)
                
                
                
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
        SignUpView()
    }
}

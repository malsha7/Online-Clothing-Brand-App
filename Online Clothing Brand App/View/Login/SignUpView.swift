//
//  SignUpView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-27.
//

import SwiftUI

struct SignUpView: View {
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isValidEmail: Bool = true
    @State private var isValidPassword: Bool = true
    @State private var isValidConfirmPassword: Bool = true
    @State private var signUpSuccess: Bool = false
          
    func handleSignUp() {
        // Validate email, password, and confirmPassword
        isValidEmail = isValidEmail(email)
        isValidPassword = isValidPassword(password)
        isValidConfirmPassword = password == confirmPassword
        
        if isValidEmail && isValidPassword && isValidConfirmPassword {
            // Call your backend API here
            // Construct the request body
            let requestBody = [
                "email": email,
                "password": password
            ]
            
            // Construct the URL of your backend endpoint
            guard let url = URL(string: "http://localhost:4000/auths/signup") else {
                print("Invalid URL")
                return
            }
            
            // Create a URLRequest
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                // Convert the request body to JSON data
                let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
                request.httpBody = jsonData
                
                // Perform the request
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error)")
                        return
                    }
                    
                    // Check the response status code
                    if let httpResponse = response as? HTTPURLResponse {
                        if (200...299).contains(httpResponse.statusCode) {
                            // Successful signup
                            print("Signup successful")
                            signUpSuccess = true
                           
                            // Handle navigation to the next screen if needed
                        } else {
                            // Signup failed
                            print("Signup failed: \(httpResponse.statusCode)")
                            
                            // Handle error message
                        }
                    }
                }.resume()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    // Email validation function
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Password validation function
    private func isValidPassword(_ password: String) -> Bool {
        // Add your password validation logic here
        // For example, you can check if the password length is at least 6 characters
        return password.count >= 6
    }
    
        
        var body: some View {
         
            ZStack {
                
                Image( "login")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.35)
                    .frame(width: 80, height: .screenHeight)
                
               
                VStack{
                    
                    
                    Spacer()
                    
                    Image( "Feminine Black Purple Brand Fashion Logo-2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .cornerRadius(20)
                        .opacity(0.78)
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
                    
                    
                    
                    // Email text field
                    TextField("Enter Email", text: $email)
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
                    
                    // Confirm Password text field
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding(20)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(20)
                        .padding(.bottom, .screenWidth * 0.04)
                        .border(Color.red, width: isValidConfirmPassword ? 0 : 1) // Border color changes if confirmPassword does not match password
                    if !isValidConfirmPassword
                    {
                        Text("Passwords do not match")
                        .foregroundColor(.red)
                                    }
                    
                    
                    // Sign up button
                    Button (action : handleSignUp){
                        Text("Sign Up")
                            .font(Font.custom("KumbhSans", size: 28))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.brown)
                            .opacity(0.7)
                            .cornerRadius(20)
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

//
//  SignInViewModel.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-27.
//

import Foundation

class SignInViewModel : ObservableObject {

@Published var email = ""
@Published var password = ""
@Published var confirmpw = ""

//validation functions
func passwordMatch() -> Bool{
    password == confirmpw
}

func isPasswordValid() -> Bool{
    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
    return passwordTest.evaluate(with: password)
}

func isEmailValid() -> Bool{
    let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
    return emailTest.evaluate(with: email)
}

var isSignInComplete: Bool {
    if !passwordMatch() ||
        !isPasswordValid() ||
        !isEmailValid() {
        return false
    }
    return true
}

// validation prompt strings
var confirmpwPrompt: String {
    if passwordMatch(){
        return ""
    } else {
        return "Password fields do not match"
    }
}

var emailPrompt: String {
    if isEmailValid() {
        return ""
    } else {
        return "Enter a valid email address"
    }
}

var passwordPrompt: String {
    if isPasswordValid() {
        return ""
    } else
    {
        return "Must be between 8 and 15 characters containing at least one number and one capital letter"
    }
}

func signIn() {
        //  signup functions then clear fields
        email = ""
        password = ""
        confirmpw = ""
        
    }
}

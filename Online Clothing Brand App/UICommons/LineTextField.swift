////
////  LineTextField.swift
////  Online Clothing app
////
////  Created by Malsha Bopage on 2024-03-25.
////
//
//
import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
           
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height:20)
            
            Divider()
            
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    
                    .frame(height:40)
            }else{
                SecureField(placholder, text: $txt)
                    .autocapitalization(.none)
                     .modifier( ShowButton(isShow: $isShowPassword))
                     .frame(height:40)
                
            }
            Divider()
        }
    }
}


   
//    #Preview {
//@State static  var txt: String = ""
//        LineTextField(txt : $txt)
//            .padding(20)
//    }
//
//


struct LineTextField_Previews: PreviewProvider {
    @State static  var txt: String = ""
    static var previews: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}

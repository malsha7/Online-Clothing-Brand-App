//
//  FooterView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack{
            Image("Feminine Black Purple Brand Fashion Logo-2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 6)
//            Image("logo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    FooterView()
}

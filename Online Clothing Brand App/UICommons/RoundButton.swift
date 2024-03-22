//
//  RoundButton.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-22.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 30))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 55, maxHeight: 55)
        .background(Color.brown.opacity(0.65))
        .cornerRadius(40)
       
    }
}

#Preview {
    RoundButton()
        .padding(20)
}

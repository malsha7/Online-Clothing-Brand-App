//
//  CategoryView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct CategoryView: View {
    var isSelected: Bool = false
    var title: String = "All"
    var body: some View {
        VStack(spacing: 1){
            Text(title)
                .font(Font.custom("KumbhSans", size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.brown : Color.placeholder.opacity(0.99))
            
           if isSelected {
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: 5, height: 5)
                    .rotationEffect(Angle(degrees: 45))
            }
        }
    }
}

#Preview {
    CategoryView()
}

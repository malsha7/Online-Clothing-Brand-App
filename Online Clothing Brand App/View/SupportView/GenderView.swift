//
//  GenderView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

struct GenderView: View {
    var isSelected: Bool = true
    var title: String = "WOMEN"
    var body: some View {
        VStack(spacing: 1){
            Text(title)
                .font(Font.custom("KumbhSans", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ?  Color.Default: Color.placeholder.opacity(0.5))
            
            if isSelected{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(height: 1)
                    
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(width: 5,height: 5)
                        .rotationEffect(Angle(degrees: 45))
                    
                }
            }else{
                Divider()
            }
        }
    }
}

#Preview {
    GenderView()
}

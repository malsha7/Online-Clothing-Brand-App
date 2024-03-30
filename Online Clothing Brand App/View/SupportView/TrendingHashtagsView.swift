//
//  TrendingHashtagsView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct TrendingHashtagsView: View {
    var body: some View {
        VStack{
            Text("@Trending")
                .font(Font.custom("KumbhSans", size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.brown)
            
                HashtagsView(tags: hashtags)
                .padding([.leading, .trailing], 14)
            
        }
    }
}

#Preview {
    TrendingHashtagsView()
}

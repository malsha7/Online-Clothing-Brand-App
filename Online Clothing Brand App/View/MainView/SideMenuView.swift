//
//  SideMenuView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-30.
//

import SwiftUI

import SwiftUI

struct SideMenuViewTemp: View {
    @State var presentSideMenu = true
    
    var body: some View {
        ZStack{
            SideMenuView()
        }
        .background(Color.brown)
    }
    @ViewBuilder
    private func SideMenuView() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
}

#Preview {
    SideMenuViewTemp()
}

struct SideMenuViewContents: View {
    @Binding var presentSideMenu: Bool
    
    var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.Dress.rawValue, Categories.TShirt.rawValue, Categories.Bag.rawValue]
    
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                SideMenuTopView()
                HStack(spacing: 10){
                    GenderView(isSelected: selectedCategory == 0, title: "WOMEN")
                        .onTapGesture {
                            selectedCategory = 0
                        }
                    GenderView(isSelected: selectedCategory == 1, title: "MEN")
                        .onTapGesture {
                            selectedCategory = 1
                        }
                    GenderView(isSelected: selectedCategory == 2, title: "KIDS")
                        .onTapGesture {
                            selectedCategory = 2
                        }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                ForEach(0..<categories.count, id: \.self){
                    i in
                    CategoryItem(title: categories[i]){
                        
                    }
                }
                
                Spacer()
                
                Button{
                    
                } label: {
                    HStack {
                        Image("icons8-call-96")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Text("+94-xxxxxxxxx")
                            .font(Font.custom("KumbhSans", size: 16))
                            .foregroundColor(Color.brown)
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                }
                
//                Button{
//                    
//                } label: {
//                    HStack {
//                        Image("Location")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 24, height: 24)
//                        Text("State Store")
//                            .font(Font.custom("KumbhSans", size: 16))
//                            .foregroundColor(.brown)
//                    }
//                    .padding(.leading, 30)
//                    .padding(.top, 20)
//                }
                
                VStack(alignment: .center) {
                    Image("Divide")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140)
                        .padding(.top, 10)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                
                HStack(spacing : 30){
                    Spacer()
                    Image("Instagram")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                    Image("YouTube")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                    Image("Twitter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .padding([.leading, .trailing], 20)
    }
    
    
    
    
    
    func SideMenuTopView() -> some View {
        VStack {
            HStack {
                
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("icons8-close-100")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
    @ViewBuilder
    func CategoryItem(title: String, action: @escaping(() -> Void))-> some View {
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                Text(title)
                    .font(Font.custom("KumbhSans", size: 16))
                    .foregroundColor(.brown)
            }
        }
        .frame(height: 50)
        .padding(.leading, 30)
        .padding(.top, 10)
    }
    
}

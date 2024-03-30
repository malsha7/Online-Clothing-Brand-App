//
//  HomeView.swift
//  Online Clothing Brand App
//
//  Created by Malsha Bopage on 2024-03-29.
//

import SwiftUI

struct HomeView: View {
    private var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.Dress.rawValue, Categories.TShirt.rawValue, Categories.Bag.rawValue]
    
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack(spacing: 0){
                    ScrollView(.vertical){
                        HeroImageView()
                        NewArrivalNew()
                        Image("Brand")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        CollectionsView()
                        TrendingHashtagsView()
                        FooterView()
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top){
                HeaderView{
                    
                } cartAction:{
                    
                    
                }
            }
        }
        
    
    }
    
    @ViewBuilder
       private func HeroImageView() -> some View{
           ZStack{
            Image("P1_01")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(maxWidth: 500)
                   .frame(height: 550)
               Button{
                   
               }label: {
                   RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).overlay{
                       Text("Explore Collection")
                           .font(Font.custom("KumbhSans", size:20))
                           .foregroundColor(.white)
                   }
                  
               }
               .frame(width: 250, height: 50)
               .tint(.brown.opacity(0.5))
               
               .offset(.init(width: 0, height: 65))
           }
       }
    
    @ViewBuilder
    private func NewArrivalNew() ->
    some View{
        Text("New Arrival")
            .font(Font.custom("KumbhSans", size: 28))
        
            .multilineTextAlignment(.center)
            .foregroundColor(.brown).opacity(0.6)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 20)
        
        Image("Divide")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0.7)
            .frame(width: 100)
            .padding(.top, 20)
        
        VStack{
            HStack(spacing: 20){
                ForEach(0..<categories.count, id: \.self){
                    i in
                    CategoryView(isSelected: i == selectedCategory, title: categories[i])
                        .onTapGesture {
                            selectedCategory = i
                        }
                }
            }
            //            .frame(minWidth: .infinity)
            .frame(minWidth: 50)
            
            HStack{
                ProductItemView(product: product1)
                ProductItemView(product: product2)
                
            }
            HStack{
                ProductItemView(product: product1)
                ProductItemView(product: product2)
                
            }
            
            Button {
                
            } label: {
                HStack(alignment: .center,spacing: 0){
                    Text("Explore Here")
                        .font(Font.custom("KumbhSans", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.brown).opacity(0.6)
                        .padding(10)
                    Image(systemName: "arrow.forward")
                        .frame(width: 18, height: 18)
                }
            }
            .tint(Color.brown)
            .padding(12)
            
        }
        
       
        }
        
    @ViewBuilder
    private func CollectionsView() -> some View {
        Text("Collections")
            .font(Font.custom("KumbhSans", size: 28))
            .foregroundColor(Color.brown).opacity(0.6)
        
        Image("winter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 220, alignment: .top)
            .clipped()
           
//        Image("")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(height: 220, alignment: .top)
//            .clipped()
        
        Image("Divide")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0.2)
            .frame(width: 150)
            .padding(.top, 20)
        
        
    }
    

    
}

#Preview {
    HomeView()
}

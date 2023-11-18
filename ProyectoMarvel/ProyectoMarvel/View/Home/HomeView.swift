//
//  HomeView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 18/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            
            VStack{
                HeroesView(viewModel: HerosViewModel())
                
            }.tabItem {
                Image(systemName: "house")
                Text("Heroes")
                
            }
        }
    }
}

#Preview {
    HomeView()
}

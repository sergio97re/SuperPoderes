//
//  HeroesDetailView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import SwiftUI

struct HeroesDetailView: View {
    @StateObject var viewModel = SeriesViewModel()
    var hero: Heros
    
    var body: some View {
        VStack{
            HStack{
                //Nombre del heroe
                Text(hero.name)
                    .bold()
                    .font(.title)
            }
            
            //Imagen del heroe
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)\(hero.thumbnail.extensionJpg)")) { Image in
                Image
                    .resizable()
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(radius: 10, x: 5, y: 5)
                
            } placeholder: {
                
            }
            
            //Descripcion del heroe
            Text(hero.description)
                .font(.title3)
                .foregroundStyle(.texto)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(hero.description == "" ? 0:1)
            
            
            HStack{
                NavigationLink(destination: SeriesView(viewModel: viewModel, hero: hero).onAppear{viewModel.getSeries(filter: "", id: hero.id)}){
                    Text("VER SERIES")
                        .foregroundStyle(.colorPrincipal)
                        .frame(width: 150, height: 50)
                        .background(.colorPrincipalButton)
                        .cornerRadius(20)
                }
            }
            .padding(.top, 50)
            Spacer()

        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()

}
}

#Preview {
    NavigationStack {
        HeroesDetailView(hero: .previewHero)
    }
}

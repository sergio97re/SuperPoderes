//
//  HeroeRowView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Heros // Modelo de Heros

    var body: some View {
        HStack {
            // Foto del héroe
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)\(hero.thumbnail.extensionJpg)")) { image in
                image.resizable()
                     .cornerRadius(20)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
        }
        .frame(height: 200)
        .background(Color.black.opacity(0.5))
        .cornerRadius(20)
        .shadow(radius: 10)
        
        // VStack para nombre
        HStack() {
            HStack {
                Text(hero.name)
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                    .padding([.top, .leading], 20)
                Spacer()
            }

            Spacer()
        }
    }
}

// Preview
#Preview {
    HeroesRowView(hero: .previewHero)
}

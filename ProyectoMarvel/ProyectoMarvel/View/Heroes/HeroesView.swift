//
//  HeroesView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel = HerosViewModel() // Inicializa el ViewModel
    @State private var filter: String = ""

    var body: some View {
        NavigationStack {
            List {
                // Verifica si hay héroes disponibles
                if let heros = viewModel.heros {
                    ForEach(heros) { hero in
                        NavigationLink {
                            // Vista de detalle del héroe
                            HeroesDetailView(hero: hero)
                        } label: {
                            // Celda personalizada para cada héroe
                            HeroesRowView(hero: hero)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Héroes de Marvel")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Salir")
                        .font(.title3)
                        .padding()
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .clipShape(.rect(cornerRadius: 20))
                }
            }
        }
        .searchable(text: $filter)
        .onChange(of: filter) { newValue in
            viewModel.getHeros(filter: newValue)
        }
    }
}

#Preview {
    HeroesView()
}

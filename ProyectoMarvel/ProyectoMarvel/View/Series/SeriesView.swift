//
//  SeriesView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var viewModel = SeriesViewModel() // Inicializa el ViewModel
    @State private var filter: String = ""
    
    var hero: Heros
    
    var body: some View {
//        let filterSeries: [Series] = {
//            if filter.isEmpty { return viewModel.series ?? []
//            }else {
//                return viewModel.series?.filter({ $0.title.uppercased().contains(filter.uppercased())}) ?? []
//            }
//        }()

        List{
            if let series = viewModel.series {
                ForEach(series) { serie in
                    SerieRowView(serie: serie)
                }
            }
        }
        .navigationTitle("Lista de series de \(hero.name)")
        .searchable(text: $filter)
        .onChange(of: filter) { _, newValue in
            viewModel.getSeries(filter: filter, id: hero.id)
        }
    }
}

#Preview {
    SeriesView(hero: .previewHero)
}

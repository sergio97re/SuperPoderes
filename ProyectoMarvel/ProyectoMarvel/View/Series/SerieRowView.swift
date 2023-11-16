//
//  SerieRowView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import SwiftUI

struct SerieRowView: View {
    var serie: Series // Modelo de Series

    var body: some View {
        ZStack {
            // Foto de la serie
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.JPGextension)")) { image in
                image.resizable()
                     .cornerRadius(20)
                     .opacity(0.8)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }

            // VStack para nombre y descripción
            VStack(alignment: .leading) {
                HStack {
                    Text(serie.title)
                        .font(.title2)
                        .foregroundColor(.black)
                        .bold()
                        .padding([.top, .leading], 20)
                        .background(.white)
                        .cornerRadius(20)
                        
                    Spacer()
                }

                Spacer()
            }
        }
        .frame(height: 500)
        .background(Color.black.opacity(0.5))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    SerieRowView(serie: Series(id: 31445, title: "Fantastic Four by Dan Slott Vol. 1 (2021)", description: "Descripcion de la serie", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")))
}

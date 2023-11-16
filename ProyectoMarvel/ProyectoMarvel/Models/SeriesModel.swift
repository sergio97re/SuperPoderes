//
//  SeriesModel.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import Foundation

struct SerieResponse: Codable{
    let data: SerieResults
}

struct SerieResults: Codable{
    let results: [Series]
}


struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    
}

struct Thumbnail: Codable {
    let path: String
    let JPGextension = "jpg"
    
    enum Keys: String, CodingKey{
        case path
        case JPHextension = "extension"
    }
}

//
//  HerosModel.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import Foundation

struct Response: Codable{
    let data: Results
}

struct Results: Codable{
    let results: [Heros]
}

struct Serie: Codable{
    let available: Int
    let collectionURI: String
    let items: [SeriesHero]
}

struct SeriesHero: Codable{
    let resourceURI: String
    let name: String
}

struct Heros: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnails
    let series: Serie
}

struct Thumbnails: Codable{
    let path: String
    let extensionJpg = ".jpg"
    
    enum keys: String, CodingKey{
        case path
        case extensionJpg = "extension"
    }
}

//
//  BaseNetwork.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import Foundation

//Constantes
let server = "https://gateway.marvel.com/v1/public/"


//Struct de metodos de red

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    
    static let content = "application/json"
}

enum Endpoints: String {
     case herosList = "characters"
     case seriesList = "/series"
}

enum Params: String {
    case apikey = "d16b556f28cc5c57c63f3c48eb739494"
    case hash = "b61f7a9cdc0d1d4bc5cf48c3af301d88"
    case ts = "1"
}

struct BaseNetwork {
    //Montamos la request del listado de heroes
    func getSessionHero(filter: String) -> URLRequest{
        let urlCadena = URL(string: "\(server)\(Endpoints.herosList.rawValue)")!
        
        //Query Params Añadimos parametros para la llamada
        var components = URLComponents(url: urlCadena, resolvingAgainstBaseURL: true)
        let qparams = [
            URLQueryItem(name: "apikey", value: Params.apikey.rawValue),
            URLQueryItem(name: "hash", value: Params.hash.rawValue),
            URLQueryItem(name: "ts", value: Params.ts.rawValue),
            filter == "" ? nil : URLQueryItem(name: "nameStartsWith", value: filter)
        ]
            .compactMap {
                $0
            }
        components?.queryItems = qparams
        //Creamos la request
        var request: URLRequest?
        if let urlParams = components?.url{
            var urlRequest = URLRequest(url: urlParams)
            urlRequest.httpMethod = HTTPMethods.get
            urlRequest.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            request = urlRequest
        }
        return request!
        
    }
    
    
    //Montamos la request del listado de series
    func getSessionSerie(filter: String, id: Int) -> URLRequest{
        let urlCadena = URL(string: "\(server)\(Endpoints.herosList.rawValue)/\(id)\(Endpoints.seriesList.rawValue)")!
        
        //Query Params Añadimos parametros para la llamada
        var components = URLComponents(url: urlCadena, resolvingAgainstBaseURL: true)
        let qparams = [
            URLQueryItem(name: "apikey", value: Params.apikey.rawValue),
            URLQueryItem(name: "hash", value: Params.hash.rawValue),
            URLQueryItem(name: "ts", value: Params.ts.rawValue),
            filter == "" ? nil : URLQueryItem(name: "titleStartsWith", value: filter)
        ]
            .compactMap {
                $0
            }
        components?.queryItems = qparams
        //Creamos la request
        var request: URLRequest?
        if let urlParams = components?.url{
            var urlRequest = URLRequest(url: urlParams)
            urlRequest.httpMethod = HTTPMethods.get
            urlRequest.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            request = urlRequest
        }
        return request!
        
    }
    
}



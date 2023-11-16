//
//  HerosViewModel.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import Foundation
import Combine

final class HerosViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var heros: [Heros]?
    
    //Combine
    var suscriptors = Set<AnyCancellable>()
    
    init(){
        getHeros(filter: "")
    }
    
    func getHeros(filter: String){
        
        //Combine
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHero(filter: filter))
            .tryMap{
                //Evaluamos si es 200 o no
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //Error
                    throw URLError(.badServerResponse)
                }
                
                //Si todo OK, devuelvo data
                return $0.data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = .error(error: "Error buscando heroes...")
                case .finished:
                    self.status = .loaded //Success
                }
            } receiveValue: { data in
                self.heros = data.data.results
                //print("Lista de heroes \(data.data.results)")
            }
            .store(in: &suscriptors)

    }
    
}

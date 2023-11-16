//
//  SeriesViewModel.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 15/11/2023.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var series: [Series]?
    
    //Combine
    var suscriptors = Set<AnyCancellable>()
    
    
    func getSeries(filter: String, id: Int){
        
        //Combine
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionSerie(filter: filter, id: id))
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
            .decode(type: SerieResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = .error(error: "Error buscando series...")
                    print(("Error al traer series"))
                case .finished:
                    self.status = .loaded //Success
                }
            } receiveValue: { data in
                self.series = data.data.results
                print("Lista de series \(data.data.results)")
            }
            .store(in: &suscriptors)

    }
}

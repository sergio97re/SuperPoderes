//
//  HerosViewModelTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
import Combine

@testable import ProyectoMarvel

final class HerosViewModelTest: XCTestCase {
    
    func testHerosViewModel() throws {
        let expectation = self.expectation(description: "Descarga de Heroes")
        var suscriptor = Set<AnyCancellable>()
        
        //Instanciamos el ViewModel
        let vm = HerosViewModel()
        XCTAssertNotNil(vm)
        
        //Creamos el observador
        vm.heros.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1) //Aqui el test esta Ok
                    expectation.fulfill() //Decimos que acaba el test
                case .failure:
                    XCTAssertEqual(1, 2) //Aqui generamos el fallo
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1) //Aqui el test esta Ok
            }
            .store(in: &suscriptor)
        
        //Lanzamos
        vm.getHeros(filter: "")
        
        self.waitForExpectations(timeout: 10)

        
    }
    
}

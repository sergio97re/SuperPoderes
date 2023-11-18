//
//  SeriesViewModelTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
import Combine

@testable import ProyectoMarvel

final class SeriesViewModelTest: XCTestCase {
    
    func testSeriesViewModel() throws {
        let expectation = self.expectation(description: "Descarga de Series")
        var suscriptor = Set<AnyCancellable>()
        
        //Instanciamos el ViewModel
        let vm = SeriesViewModel()
        XCTAssertNotNil(vm)
        
        //Creamos el observador
        vm.series.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        
        //Lanzamos
        vm.getSeries(filter: "", id: 1)
        
        self.waitForExpectations(timeout: 10)

    }
}

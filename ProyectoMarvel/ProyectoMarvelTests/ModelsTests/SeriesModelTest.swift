//
//  SeriesModelTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest

@testable import ProyectoMarvel

final class SeriesModelTest: XCTestCase {

    func testSeriesModelDecoding() throws {
        //Creamos un String que contiene un JSON que usaremos de ejemplo para el test
        let json = """
        {
            "data": {
                "results": [
                    {
                        "id": 123,
                        "title": "Serie de Prueba",
                        "description": "Descripción de la serie de prueba.",
                        "thumbnail": {
                            "path": "http://path.to.thumbnail",
                            "extension": "jpg"
                        }
                    }
                ]
            }
        }
        """.data(using: .utf8)!
        
        //Usamos JSONDecoder para intentar decodificar la Data al modelo Series
        let decoder = JSONDecoder()
        let response = try decoder.decode(SerieResponse.self, from: json)

        XCTAssertEqual(response.data.results.count, 1)
        let firstSerie = response.data.results.first
        XCTAssertEqual(firstSerie?.id, 123)
        XCTAssertEqual(firstSerie?.title, "Serie de Prueba")
        XCTAssertEqual(firstSerie?.description, "Descripción de la serie de prueba.")
        XCTAssertEqual(firstSerie?.thumbnail.path, "http://path.to.thumbnail")
    }
}


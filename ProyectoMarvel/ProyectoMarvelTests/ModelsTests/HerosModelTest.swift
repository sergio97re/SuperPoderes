//
//  HerosModelTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
@testable import ProyectoMarvel

final class HerosModelTest: XCTestCase {

    func testHerosModelDecoding() throws {
        //Creamos un String que contiene un JSON que usaremos de ejemplo para el test
        let json = """
        {
          "id": 1011334,
          "name": "3-D Man",
          "description": "Descripción de prueba del héroe.",
          "thumbnail": {
            "path": "http://path.to.thumbnail",
            "extension": "jpg"
          },
          "series": {
            "available": 1,
            "collectionURI": "http://path.to.collection",
            "items": [
              {
                "resourceURI": "http://path.to.resource",
                "name": "Serie de prueba"
              }
            ]
          }
        }
        """.data(using: .utf8)!

        //Usamos JSONDecoder para intentar decodificar la Data al modelo Heros
        let decoder = JSONDecoder()
        let hero = try decoder.decode(Heros.self, from: json)
        

        XCTAssertEqual(hero.id, 1011334)
        XCTAssertEqual(hero.name, "3-D Man")
        XCTAssertEqual(hero.description, "Descripción de prueba del héroe.")
        XCTAssertEqual(hero.thumbnail.path, "http://path.to.thumbnail")
        XCTAssertEqual(hero.series.available, 1)
        XCTAssertEqual(hero.series.items.first?.name, "Serie de prueba")
    }
}


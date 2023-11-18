//
//  SeriesRowViewTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import ProyectoMarvel

final class SeriesRowViewTest: XCTestCase {
    
    func testSeriesRowViewTest() throws {
        //Creamos una serie de ejemplo para la prueba
        let serie = Series(id: 31445, title: "Fantastic Four by Dan Slott Vol. 1 (2021)", description: "Descripcion de la serie", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"))
        
        //Instanciamos la vista con el heroe de prueba
        let view = SerieRowView(serie: serie)
        
        //Verificamos que la vista contiene los elementos esperados
        XCTAssertNoThrow(try view.inspect().find(viewWithId: 0).image())
        XCTAssertNoThrow(try view.inspect().find(viewWithId: 1).text())
        
        //Verificamos el contenido del texto
        XCTAssertEqual(try view.inspect().find(viewWithId: 1).text().string(), "Fantastic Four by Dan Slott Vol. 1 (2021)")
    }
}

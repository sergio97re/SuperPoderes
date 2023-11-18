//
//  HeroesRowViewTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import ProyectoMarvel

final class HeroesRowViewTest: XCTestCase {
    
    func testHeroesRowViewTest() throws {
        //Creamos un heroe de ejemplo para la prueba
        let hero = Heros(id: 1, name: "Goku", description: "Descripcion de Goku", thumbnail: Thumbnails(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), series: Serie(available: 1, collectionURI: "http://path.to.collection", items: []))
        
        //Instanciamos la vista con el heroe de prueba
        let view = HeroesRowView(hero: hero)
        
        //Verificamos que la vista contiene los elementos esperados
        XCTAssertNoThrow(try view.inspect().find(viewWithId: 0).image())
        XCTAssertNoThrow(try view.inspect().find(viewWithId: 1).text())
        
        //Verificamos el contenido del texto
        XCTAssertEqual(try view.inspect().find(viewWithId: 1).text().string(), "Goku")
    }
}

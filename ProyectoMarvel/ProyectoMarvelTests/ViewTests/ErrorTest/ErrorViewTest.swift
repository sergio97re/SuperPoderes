//
//  ErrorViewTest.swift
//  ProyectoMarvelTests
//
//  Created by Sergio Reina Montes on 17/11/2023.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import ProyectoMarvel


final class ErrorViewTest: XCTestCase {
    
    func testErrorView() throws {
        let view = ErrorView(error: "Testing")
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        //Texto
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Testing")
        
        //Boton
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        
        //Ejecutar el boton tap
        try boton.button().tap()
        
        
    }
}

//
//  ProyectoMarvelApp.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 13/11/2023.
//

import SwiftUI

@main
struct ProyectoMarvelApp: App {
    @State var launchScreenChange: Bool = false

    var body: some Scene {
        WindowGroup {
            if launchScreenChange {
                PrincipalView()
            }else {
                LaunchScreenView(launchScreenChange: $launchScreenChange)
            }
            
            
        }
    }
}

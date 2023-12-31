//
//  PrincipalView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import SwiftUI

struct PrincipalView: View {
    @StateObject var viewModelHeros: HerosViewModel = HerosViewModel()
    
    var body: some View {
        switch viewModelHeros.status{
        case .loading:
            LoaderView()
        case .loaded:
            HomeView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        }
    }
}

#Preview {
    PrincipalView()
        
}

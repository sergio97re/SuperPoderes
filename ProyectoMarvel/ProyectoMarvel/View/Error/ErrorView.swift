//
//  ErrorView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import SwiftUI

struct ErrorView: View {
    
    private var textError: String
    
    init(error: String){
        self.textError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
                .id(0)
            
            Text("\(textError)")
                .font(.title2)
                .foregroundStyle(.red)
                .bold()
                .padding(.top, 50)
                .id(1)
            
            Spacer()
            
            //Botton
            Button(action: {
                //Accion...
            }, label: {
                Text("Volver")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 10, y: 10)
                
            })
            .id(2)
        }
    }
}


#Preview {
    ErrorView(error: "¡Atención! Ha ocurrido un error...")
}

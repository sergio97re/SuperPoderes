//
//  LoaderView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 18/11/2023.
//

import SwiftUI

struct LoaderView: View {
//    @Binding var launchScreenChange: Bool
    
    var body: some View {
        
        ZStack {
            Image("Marvel-universe")
                .resizable()
                .ignoresSafeArea()
            
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.4)
            
            VStack (spacing: 50) {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 100,height: 80)
                    .foregroundColor(.white)
                
                Text("CARGANDO DATOS...")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.top, 250)
//            .onAppear{
//                DispatchQueue.main.asyncAfter(deadline: .now()+2){
//                    withAnimation{
//                        launchScreenChange.toggle()
//                    }
//                }
//            }
        }
    }
}

#Preview {
    LoaderView()
}

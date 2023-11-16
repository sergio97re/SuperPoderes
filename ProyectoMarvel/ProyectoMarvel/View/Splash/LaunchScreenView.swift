//
//  LaunchScreenView.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 14/11/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var launchScreenChange: Bool
    
    var body: some View {
        
        ZStack {
            Image("Marvel-universe")
                .resizable()
                .ignoresSafeArea()
            
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.4)
            
            VStack (spacing: 50) {
                Image("Logo Marvel")
                    .resizable()
                    .frame(width: 200,height: 80)
                
                Text("BIENVENID@...")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.top, 250)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    withAnimation{
                        launchScreenChange.toggle()
                    }
                }
            }
        }
    }
}
    
#Preview {
    LaunchScreenView(launchScreenChange: .constant(false))
}


//
//  SplashView.swift
//  AcademyFirstChallenge
//
//  Created by MARIANA FRACAROLI LOPES on 14/04/26.
//

import SwiftUI

struct SplashView: View {
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0.0
    @State private var moveUp: CGFloat = 20
    
    var body: some View {
        ZStack{
            Color("azulEscuro")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image("boraiLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(y: moveUp)
                
                Text("Quer Viajar? ")
                    .font(.custom("Poppins-Regular", size: 32))
                +
                Text("Boraí ")
                    .font(.custom("Poppins-SemiBold", size: 32))
            }
        }
        .foregroundColor(.white)
        .opacity(opacity)
        .offset(y: moveUp + 10)
        
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                scale = 1.0
                opacity = 1.0
                moveUp = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)){
                    scale = 1.05
                }
                
            }
        }
    }
}

#Preview {
    SplashView()
        .ignoresSafeArea(.all)
}

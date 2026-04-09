//
//  MeusVoos.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct MeusVoos: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0){
                
                header
               
                
            }
        }
       
    } //var body
    var header: some View {
        ZStack {
            LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            HStack {
                Button {
                    print("Voltar") }
                label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.white)
                        .opacity(0)
                        
                }
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "airplane")
                        .foregroundStyle(Color.white)
                    
                    Text("Seus Voos")
                        .font(.custom("Poppins-SemiBold", size: 16.0))
                        .foregroundStyle(Color.white)
                }
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
            
            }
            .padding(.horizontal)
            .padding(.top, 60)
        }
        .frame(height: 140)
    }
}

#Preview {
    MeusVoos()
}

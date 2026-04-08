//
//  HomePage.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            headerSection
            
            serviceOptions
            
        }
    }
}

private extension HomePage {
    var headerSection: some View {
        ZStack{
            Image("headerHome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(Color("azulEscuro").opacity(0.4).cornerRadius(35))
            
            VStack{
                Text("Aqui você encontra as\nmelhores ofertas para viajar")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink(destination: BuscarPassagem(), label: {
                    Text("Comprar Passagem")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("azulEscuro"))
                        }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .padding(.bottom, 30)
    }
    
    var serviceOptions: some View {
        VStack{
            Text("O que você está procurando?")
            
            HStack{
                
            }
        }
    }
}

#Preview {
    HomePage()
}

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
                .overlay(Color("azulEscuro")
                    .opacity(0.5)
                    .cornerRadius(40)
                    .blendMode(.plusDarker)
                )
            
            VStack{
                Text("Aqui você encontra as\nmelhores ofertas para viajar")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                    .foregroundColor(Color("offWhite"))
                    .fontWeight(.bold)
                    .font(.title3)
                
                NavigationLink(destination: BuscarPassagem(), label: {
                    Text("Comprar Passagem")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("btnVermelho"))
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
                VStack{
                    Image(systemName: "airplane")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Color("btnLaranja"),
                            in: Circle(),
                        )
                    
                    Text("Passagens")
                }
            }
        }
    }
}

struct btnRedondo: View {
    var body: some View {
        VStack{
            Image(systemName: "airplane")
                .padding()
                .foregroundColor(.white)
                .background(
                    Color("btnLaranja"),
                    in: Circle(),
                )
            
            Text("Passagens")
        }
    }
}

#Preview {
    HomePage()
}

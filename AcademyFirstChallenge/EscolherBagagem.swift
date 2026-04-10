//
//  EscolherBagagem.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct EscolherBagagem: View {
    @State private var selecionado = false
    @State private var mostrarNotificacao = false
    
    var body: some View {
        ZStack{
            
            LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                header
                
                Spacer()
                
                NavigationLink(destination: InfoPassageiro(), label: {
                    boraiBtn(textBtn: "Escolher Bagagem", txtColor: "offWhite", btnColor: "azulEscuro")})
                
                
                
            }
            if mostrarNotificacao {
                notificacaoView
                    .transition(.scale)
            }
        }
        
        
        
    }//var body
    
    var header: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .opacity(0)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "suitcase")
                        .foregroundColor(.white)
                    Text("Opções de Bagagem")
                        .font(.custom("Poppins-SemiBold", size: 16.0))
                        .foregroundStyle(Color.white)
                }
                Spacer()
                Button {
                    withAnimation {
                        mostrarNotificacao.toggle()
                    }
                } label: {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, 25)
            }
        } //var header
    
    var notificacaoView: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        mostrarNotificacao = false
                    }
                }
            VStack(spacing: 12) {
                Image("caixaCorreio")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 60)
                Text("Você não tem notificações!")
                    .font(.custom("Poppins-SemiBold", size: 16))
                Text("Por enquanto, não temos notificações para mostrar...")
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
            }
            .padding()
            .frame(maxWidth: 300, maxHeight: 600, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            
        }
    }
    }
    
   


#Preview {
    EscolherBagagem()
}

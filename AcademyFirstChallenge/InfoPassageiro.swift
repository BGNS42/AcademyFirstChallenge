//
//  InfoPassageiro.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct InfoPassageiro: View {
    @State private var passageiroSelecionado: Int? = 1
    @State private var mostrarNotificacao = false
    var body: some View {
        NavigationStack{
            ZStack {
                
                LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    
                    header
                    
                }
                
                
                
                
                
                if mostrarNotificacao {
                    notificacaoView
                        .transition(.scale)
                }
            }
            
            
        }
        
        // HStack{
        // NavigationLink(destination: InfoPagamento(), label: {
        //boraiBtn(textBtn: "Ir ao pagamento", txtColor: "offWhite", btnColor: "azulEscuro")})
        // }
    } //var body
    
    var header: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .opacity(0)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                    Text("Passageiros")
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
            .padding(.top, -40)
            
            
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
    }//var notificacao
    
}
    


#Preview {
    InfoPassageiro()
}

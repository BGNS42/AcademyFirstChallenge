//
//  InfoPagamento.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct InfoPagamento: View {
    @State private var nomeCartao = ""
    @State private var numeroCartao = ""
    @State private var validade = ""
    @State private var cvv = ""
    @State private var mostrarNotificacao = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                
                VStack {
                    
                    header
                }
                
                
                if mostrarNotificacao {
                    notificacaoView
                        .transition(.scale)
                }
            }
        }
     
            
      
            
           // NavigationLink(destination: ResumoPedido(), label: {
                //boraiBtn(textBtn: "Pagar", txtColor: "offWhite", btnColor: "azulEscuro")})
        
        }// var body
    
    var header: some View {
            ZStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .opacity(0)
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image("moneyBag")
                            .foregroundColor(.white)
                        Text("Pagamento")
                            .font(.custom("Poppins-SemiBold", size: 16.0))
                            .foregroundStyle(Color.black)
                        
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            mostrarNotificacao.toggle()
                        }
                    } label: {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.black)
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
    } //var notificacao
    
    }


#Preview {
    InfoPagamento()
}

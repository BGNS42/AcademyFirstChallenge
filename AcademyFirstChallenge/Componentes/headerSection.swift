//
//  headerSection.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct headerSection: View {
    var pageTitle: String = "Page Title"
    var pageIcon: String = ""
    @Binding var mostrarNotificacao: Bool
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundStyle(Color.offWhite)
                    .font(.title3)
                    .opacity(0)
                
                Spacer()
                
                VStack(spacing: 4) {
                    if !pageIcon.isEmpty {
                        if pageIcon.contains("airplane") || pageIcon.contains("suitcase.fill") || pageIcon.contains("person.fill"){
                            Image(systemName: pageIcon)
                                //.resizable()
                                .frame(height: 30)
                                .foregroundStyle(Color.white)
                        } else {
                            Image(pageIcon)
                            //.resizable()
                                .frame(height: 30)
                                .foregroundStyle(Color.white)
                        }
                    }
                    
                    
                    Text(pageTitle)
                        .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                        .foregroundStyle(Color.offWhite)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        mostrarNotificacao.toggle()
                    }
                } label: {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
//                .contentShape(Circle())
//                .zIndex(99)
            }
            .padding()
        }
        .padding(.horizontal)
        //.padding(.bottom, 50)
        //.background(Color.black)
        .padding(.top, -50) // PADDING PRA POSICIONAR HEADER NA MESMA LINHA DO BOTAO DE VOLTAR
        // NAO COLOCAR PADDING NEGATIVO MENOR QUE -50 SE NAO O BTN NAO FUNCIONA
    }
}

struct notificacaoView: View {
    @Binding var mostrarNotificacao: Bool
    
    var body: some View {
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
        .ignoresSafeArea()
    }
}


#Preview {
    headerSection(mostrarNotificacao: .constant(false))
}

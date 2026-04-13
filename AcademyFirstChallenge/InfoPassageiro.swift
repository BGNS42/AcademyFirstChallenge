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
                    
                    ScrollView{
                        VStack(spacing: 16) {
                           passageiroCard(titulo: "Passageiro 1", index: 1)
                        passageiroCard(titulo: "Passageiro 2", index: 2)
                            
                            //totalView
                        }
                        .padding()
                    }
                    
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
    
    func passageiroCard(titulo: String, index: Int) -> some View {
        let isOpen = passageiroSelecionado == index
        
        return VStack(spacing: 0) {
            Button {
                withAnimation {
                    if passageiroSelecionado == index {
                        passageiroSelecionado = nil
                    } else {
                        passageiroSelecionado = index
                        
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                    
                    Text(titulo)
                        .font(.custom("Poppins-SemiBold", size: 16))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isOpen ? 90 : 0))
                        .foregroundColor(.white)
                    
                }
                .padding()
                .background(Color("azulEscuro"))
            }
            if isOpen {
                VStack(spacing: 12) {
                    campo("Nome Completo", icon: "person")
                    campo("CPF ou Passaporte", icon: "doc.text")
                    campo("Data de nascimento", icon: "calendar")
                    campo("Telefone", icon: "phone")
                    
                }
                .padding()
                .background(Color.white)
            }
        }
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    func campo(_ placeholder: String, icon: String) -> some View{
        HStack{
            Image(systemName: icon)
                .foregroundColor(.gray)
            TextField(placeholder, text: .constant(""))
                .font(.custom("Poppins-Regular", size: 14))
        }
        .padding()
        .background(Color.gray.opacity(0.01))
        .cornerRadius(10)
    }
    
    
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

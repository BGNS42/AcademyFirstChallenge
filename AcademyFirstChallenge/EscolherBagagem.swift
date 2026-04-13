//
//  EscolherBagagem.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct EscolherBagagem: View {
    @State private var selecionado = 0
    @State private var mostrarNotificacao = false
    
    var body: some View {
        ZStack{
            
            LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                header
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        
                        
                        
                  bagagemCard(titulo: "Light", preco: "R$ 121,55", itens: [
                    "Bolsa ou mochila pequena até 10kg",
                    "Mala pequena até 10kg",
                    "Remarcação com taxa"
                  ], index: 0)
                        
                  bagagemCard(titulo: "Standard", preco: "R$ 215,55", itens: [
                          "Bolsa ou mochila pequena até 10kg",
                          "Mala pequena até 10kg",
                          "Bagagem despachada até 23kg",
                          "Remarcação com taxa"
                        ], index: 1)
                        
                   bagagemCard(titulo: "Full", preco: "R$ 289,9", itens: [
                          "Bolsa ou mochila pequena até 10kg",
                          "Mala pequena até 12kg",
                          "Bagagem despachada até 23kg",
                          "Seleção de assento comum",
                          "Remarcação sem taxa"
                        ], index: 2)
                        
                        bagagemCard(titulo: "Premium Economy", preco: "R$ 320,35", itens: [
                               "Bolsa ou mochila pequena até 10kg",
                               "Mala pequena até 16kg",
                               "Bagagem despachada até 23kg",
                               "Mais espaço para as pernas",
                               "Assento do meio bloqueado",
                               "Remarcação sem taxa"
                             ], index: 3)
  
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
                
               // NavigationLink(destination: InfoPassageiro(), label: {
                   // boraiBtn(textBtn: "Escolher Bagagem", txtColor: "offWhite", btnColor: "azulEscuro")})
                
                
                
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
                    Image(systemName: "suitcase.fill")
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
            .padding(.top, -40)
            }
        } //var header
    
    func bagagemCard(titulo: String, preco: String, itens: [String], index: Int) -> some View {
        VStack(alignment: .leading) {
        VStack(alignment: .leading, spacing: 20){
            
            Text(titulo)
                .font(.custom("Poppins-SemiBold", size: 20))
            
            VStack(alignment: .leading, spacing: 22) {
                ForEach(itens, id: \.self) { item in
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color("azulEscuro"))
                            .padding(.top, 2)
                        
                        Text(item)
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundStyle(Color.black)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: . leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }

                    }
                }
            }
            Spacer()
            
            Text("Mais detalhes")
                .font(.custom("Poppins-Regular", size: 15))
                .foregroundColor(.gray)
                .underline()
            
            Divider()
            
            Text(preco)
                .font(.custom("Poppins-SemiBold", size: 32))
            
            Text("Por passageiro")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.gray)
            
            HStack{
                NavigationLink(destination: InfoPassageiro(), label: {
                    boraiBtn(textBtn: "Escolher Bagagem", txtColor: "offWhite", btnColor: "azulEscuro")})
            }
            .padding(.horizontal)
        }
        .buttonStyle(.plain)
        .padding()
        .frame(width: 340, height: 600, alignment: .top)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 6)
        .scaleEffect(selecionado == index ? 1 : 0.95)
        .animation(.easeInOut, value: selecionado)
        .onTapGesture {
            selecionado = index
        
        
    }    //var bagagem
        
       
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
    NavigationStack{
        EscolherBagagem()
    }
}
    

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
    @State private var bandeira = "unknown"
    @State private var salvarCartao = false
    var body: some View {
        //NavigationStack {
            ZStack {
                
                
                
                VStack(spacing: 20) {
                    
                    header
                    
                    cardView
                    
                    camposPagamento
                
                }
                
                
                if mostrarNotificacao {
                    notificacaoView
                        .transition(.scale)
                }
            //}
        }
     
            
      
            
           // NavigationLink(destination: ResumoPedido(), label: {
                //boraiBtn(textBtn: "Pagar", txtColor: "offWhite", btnColor: "azulEscuro")})
        
        }// var body
    
    var header: some View {
            ZStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.title3)
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
                            .font(.title3)
                    }
                }
                .padding(.horizontal)
                .padding(.top, -30)
                
                
            }
        } //var header
    
    var cardView: some View {
        ZStack {
            Image("cardBackground")
                .resizable()
                .scaledToFill()
            
            //LinearGradient(colors: [Color.purple, Color.blue, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                //.cornerRadius(20)
           // RadialGradient(colors: [Color.white.opacity(0.3), Color.clear], center: .topTrailing, startRadius: 10, endRadius: 200)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack{
                    Spacer()
                    if bandeira == "mastercard" {
                        Image("mastercard")
                            .resizable()
                            .frame(width: 40, height: 25)
                    } else if bandeira == "visa" {
                        Image("visa")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image(systemName: "creditcard")
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 30)
                Text(numeroCartao.isEmpty ? "****  ****  ****  ****" : numeroCartao)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("Validade")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-SemiBold", size: 14.33))
                        
                        Text(validade.isEmpty ? "**/**" : validade)
                            .foregroundColor(.white)
                    
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("CVV")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-SemiBold", size: 14.33))
                        
                        Text(cvv.isEmpty ? "***" : cvv)
                            .foregroundColor(.white)
                    }
                }
                Text(nomeCartao.isEmpty ? "Nome do Titular" : nomeCartao)
                    .foregroundColor(.white)
                    .font(.custom("Poppins-SemiBold", size: 14.33))
                
                
            }
            .padding()
            
        }
        .frame(height: 236)
        .padding(.horizontal)
    } // cardview
    
    var camposPagamento: some View {
        VStack(spacing: 16){
            TextField("Nome do Titular", text: $nomeCartao)
                .font(.custom("Poppins-Medium", size: 15))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Número do Cartão", text: $numeroCartao)
                .font(.custom("Poppins-Medium", size: 15))
                .keyboardType(.numberPad)
                .onChange(of: numeroCartao) { newValue in
                    numeroCartao = formatCardNumber(newValue)
                    bandeira = detectarBandeira(numeroCartao)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            HStack{
                TextField("Validade", text: $validade)
                    .font(.custom("Poppins-Medium", size: 15))
                    .keyboardType(.numberPad)
                    .onChange(of: validade) { newValue in
                        validade = formatValidade(newValue)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                TextField("CVV", text: $cvv)
                    .font(.custom("Poppins-Medium", size: 15))
                    .keyboardType(.numberPad)
                    .onChange(of: cvv) { newValue in
                        cvv = formatCVV(newValue)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            HStack {
                Text("Salvar Cartão")
                    .font(.custom("Poppins-Medium", size: 16))
                    .opacity(0.7)
                Toggle("", isOn: $salvarCartao)
                    .tint(Color("azulEscuro"))
                    
                
            }
            .padding()
            
            NavigationLink(destination: ResumoDoPedido(), label: {
                boraiBtn(textBtn: "Pagar", txtColor: .offWhite, btnColor: .azulEscuro)})
                
        }
        .padding()
    } //var camposPagamento
    
    func formatCardNumber(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        
        for(index, number) in numbers.enumerated() {
            if index != 0 && index % 4 == 0 {
                result.append(" ")
            }
            if index >= 16 { break }
            result.append(number)
        }
        return result
    }
    
    func formatValidade(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        
        for(index, number) in numbers.enumerated() {
            if index == 2 {
                result.append("/")
            }
            if index >= 4 { break }
            result.append(number)
        }
        return result
    }
    
    func formatCVV(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        return String(numbers.prefix(3))
    }
    
    func detectarBandeira(_ numero: String) -> String {
        let numbers = numero.replacingOccurrences(of: " ", with: "")
        
        if numbers.hasPrefix("4") {
            return "visa"
        }
        if let prefix2 = Int(numbers.prefix(2)), (51...55).contains(prefix2) {
            return "mastercard"
        }
        if let prefix4 = Int(numbers.prefix(4)), (2221...2710).contains(prefix4) {
            return "mastercard"
        }
        return "unknown"
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
    } //var notificacao
    
    }


#Preview {
    InfoPagamento()
}

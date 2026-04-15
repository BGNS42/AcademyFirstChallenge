//
//  InfoPassageiro.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct Passageiro {
    var nome: String = ""
    var cpf: String = ""
    var dataNascimento: String = ""
    var email: String = ""
    var telefone: String = ""
}

struct InfoPassageiro: View {
    
    @State private var passageiroSelecionado: Int? = 1
    @State private var mostrarNotificacao = false
    
    @State private var passageiros: [Passageiro] = Array(repeating: Passageiro(), count: 4)
    
    var body: some View {
        //NavigationStack {
            ZStack {
                
                LinearGradient(
                    colors: [Color("gradientTop"), Color("gradientBottom")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    
                    header
                    flightCard
                    
                    Spacer(minLength: 25)
                    
                    Text("Preencha seus dados")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.white)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            
                            passageiroCard(titulo: "Passageiro 1", index: 1)
                            passageiroCard(titulo: "Passageiro 2", index: 2)
                            passageiroCard(titulo: "Passageiro 3", index: 3)
                            passageiroCard(titulo: "Passageiro 4", index: 4)
                            
                        }
                        .padding()
                    }
                    
                    totalView
                        .padding()
                }
                
                if mostrarNotificacao {
                    notificacaoView
                        .transition(.scale)
                }
            }
        //}
    }
    
    var header: some View {
            ZStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.title3)
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
                            .font(.title3)
                    }
                }
                .padding(.horizontal)
                .padding(.top, -30)
                
                
            }
        } //var header
        
    
    var flightCard: some View {
            VStack(spacing: 12) {
                HStack{
                    Text("GRU")
                        .font(Font.custom("Poppins-SemiBold", size: 16))
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color("azulEscuro"))
                        
                    
                    Text("SDU")
                        .font(Font.custom("Poppins-SemiBold", size: 16))
                    Spacer()
                    
                    Text("Seg, 27 Abr  /  10:20 - 11:50")
                        .font(Font.custom("Poppins-Regular", size: 12))
                        .foregroundColor(.gray)
                }
                HStack{
                    Circle()
                        .fill(Color("azulEscuro"))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3 , 3]))
                        .foregroundColor(.black.opacity(0.5))
                        .frame(height: 0.4)
                        .overlay(Image(systemName: "airplane")
                            .foregroundColor(Color("azulEscuro")))
                    
                    Circle()
                        .fill(Color("azulEscuro"))
                        .frame(width: 8, height: 8)
                    
                    
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal)
        }
        
    
    func passageiroCard(titulo: String, index: Int) -> some View {
        
        let isOpen = passageiroSelecionado == index
        let i = index - 1
        
        return VStack(spacing: 0) {
            
            Button {
                withAnimation {
                    passageiroSelecionado = (passageiroSelecionado == index ? nil : index)
                }
            } label: {
                HStack {
                    Image("personIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 40)
                    
                    Text(titulo)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isOpen ? 90 : 0))
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color("azulEscuro"))
            }
            
            if isOpen {
                VStack(spacing: 10) {
                    
                    campo("Nome Completo", icon: "person", text: $passageiros[i].nome)
                        .foregroundColor(.gray)
                    
                    
                    campoCPF(i: i)
                        .foregroundColor(.gray)
                    campoData(i: i)
                        .foregroundColor(.gray)
                    
                    campo("E-mail", icon: "envelope", text: $passageiros[i].email)
                        .foregroundColor(.gray)
                    
                    campoTelefone(i: i)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
            }
        }
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    func campo(_ placeholder: String, icon: String, text: Binding<String>) -> some View {
        HStack {
            Image(systemName: icon)
            TextField(placeholder, text: text)
                .font(.custom("Poppins-Medium", size: 13))
           
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
    
    func campoCPF(i: Int) -> some View {
        HStack {
            Image(systemName: "doc.text")
            TextField("CPF", text: $passageiros[i].cpf)
                .font(.custom("Poppins-Medium", size: 13))
                .keyboardType(.numberPad)
                .onChange(of: passageiros[i].cpf) { newValue in
                    passageiros[i].cpf = formatCPF(newValue)
                }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
    
    func campoData(i: Int) -> some View {
        HStack {
            Image(systemName: "calendar")
            TextField("Data de nascimento", text: $passageiros[i].dataNascimento)
                .font(.custom("Poppins-Medium", size: 13))
                .keyboardType(.numberPad)
                .onChange(of: passageiros[i].dataNascimento) { newValue in
                    passageiros[i].dataNascimento = formatDate(newValue)
                }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
    
    func campoTelefone(i: Int) -> some View {
        HStack {
            Image(systemName: "phone")
            TextField("Telefone", text: $passageiros[i].telefone)
                .font(.custom("Poppins-Medium", size: 13))
                .keyboardType(.numberPad)
                .onChange(of: passageiros[i].telefone) { newValue in
                    passageiros[i].telefone = formatTelef(newValue)
                }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
    
   
    
    var totalView: some View {
        VStack(spacing: 12) {
            
            HStack {
                Text("Total")
                Spacer()
                Text("R$ 981,55")
            }
            
            NavigationLink(destination: InfoPagamento()) {
                boraiBtn(textBtn: "Ir ao pagamento", txtColor: .offWhite, btnColor: .azulEscuro)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
    
    func formatCPF(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        for (index, number) in numbers.enumerated() {
            if index == 3 || index == 6 { result.append(".") }
            if index == 9 { result.append("-") }
            if index >= 11 { break }
            result.append(number)
        }
        return result
    }
    
    func formatDate(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        for (index, number) in numbers.enumerated() {
            if index == 2 || index == 4 { result.append("/") }
            if index >= 8 { break }
            result.append(number)
        }
        return result
    }
    
    func formatTelef(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        for (index, number) in numbers.enumerated() {
            if index == 0 { result.append("(") }
            if index == 2 { result.append(")") }
            if index == 7 { result.append("-") }
            if index >= 11 { break }
            result.append(number)
        }
        return result
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
//    NavigationStack{
        InfoPassageiro()
//    }
}

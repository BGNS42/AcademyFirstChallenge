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
    @State private var animatePlane = false
    @State private var cpf = ""
    @State private var dataNascimento = ""
    @State private var numTelefone = ""
    var body: some View {
        NavigationStack{
            ZStack {
                
                LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    
                    header
                    
                    flightCard
                        Spacer(minLength: 25)
                    Text("Preencha seus dados")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.white)
                    
                    ScrollView{
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
                    Image("personIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 40)
                        
                        
                    
                    Text(titulo)
                        .font(.custom("Poppins-Medium", size: 16))
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
                    campo("Nome Completo", icon: "person")
                    HStack{
                        Image(systemName: "doc.text")
                            .foregroundColor(.gray)
                        
                        TextField("CPF ou Passaporte", text: $cpf)
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 14))
                            .onChange(of: cpf) { newValue in
                                cpf = formatCPF(newValue)
                            }
                    } .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                    
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        
                        TextField("Data de nascimento", text: $dataNascimento)
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 14))
                            .onChange(of: dataNascimento) { newValue in
                                dataNascimento = formatDate(newValue)
                            }
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    
                    //campo("CPF ou Passaporte", icon: "doc.text")
                    //campo("Data de nascimento", icon: "calendar")
                    campo("E-mail", icon: "envelope")
                    HStack{
                        Image(systemName: "phone")
                            .foregroundColor(.gray)
                        
                        TextField("Telefone", text: $numTelefone)
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 14))
                            .onChange(of: numTelefone) { newValue in
                                numTelefone = formatTelef(newValue)
                            }
                    }
                    .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                   // campo("Telefone", icon: "phone")
                    
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
    
    var totalView: some View{
        VStack(spacing: 12){
            
            HStack{
                Text("Total")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("R$ 981,55")
                    .font(.custom("Poppins-SemiBold", size: 17))
            }
           
            NavigationLink(destination: InfoPagamento(), label: {
            boraiBtn(textBtn: "Ir ao pagamento", txtColor: "offWhite", btnColor: "azulEscuro")})
         
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
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
    
    func formatCPF(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
            var result = ""
            for(index, number) in numbers.enumerated( ) {
                if index == 3 || index == 6 {
                    result.append(".")
                }
                if index == 9 {
                    result.append("-")
                }
                if index >= 11 { break }
                result.append(number)
            }
            return result
            
        }
    
    func formatDate(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        for(index, number) in numbers.enumerated( ) {
            if index == 2 || index == 4 {
                result.append("/")
            }
            if index >= 8 { break }
            result.append(number)
        }
        return result
    }
    
    func formatTelef(_ value: String) -> String {
        let numbers = value.filter { $0.isNumber }
        var result = ""
        for(index, number) in numbers.enumerated( ) {
            if index == 0 {
                result.append("(")
            }
            if index == 2  {
                result.append(")")
            }
            if index == 7 {
                result.append( "-")
            }
            if index >= 11 { break }
            result.append(number)
        }
        return result
    }
        
    }
    

    


#Preview {
    NavigationStack{
        InfoPassageiro()
    }
}

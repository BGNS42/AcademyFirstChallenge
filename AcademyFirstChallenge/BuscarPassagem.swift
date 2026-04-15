//
//  BuscarPassagem.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct BuscarPassagem: View {
    @State private var origin = ""
    @State private var destination = ""
    @State private var departureDate = Date()
    @State private var returnDate = Date()
    @State private var tripType = ""
    @State private var passengers = 1
    //@State private var showSuggestions: Bool = false
    
    @State private var mostrarNotificacao = false
    
    let destinationOptions: [String] = ["Rio de Janeiro, SDU", "São Paulo, GRU"]
    let assentosOptions: [String] = ["Econômica", "Executiva"]
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [Color("gradientTop"), Color("gradientBottom")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                headerSection(pageTitle: "Comprar Passagem", pageIcon: "buyTicketImg", mostrarNotificacao: $mostrarNotificacao)
                
                
                Spacer()
                ScrollView{
                    formBuscaVoo
                    
                    Spacer()
                    
                    cardCupom
                    
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: gradientColors))
            
            if mostrarNotificacao {
                notificacaoView(mostrarNotificacao: $mostrarNotificacao)
                    .transition(.scale)
            }
        }
    }
    
    var formBuscaVoo: some View {
        VStack(alignment: .leading, spacing: 5){
            campoOrigem
            
            campoDestino
            
            campoDatas
            
            campoPassageirosEAssento
            
            HStack(alignment: .center){
                Spacer()
                NavigationLink(destination: VoosIda(), label: {
                    boraiBtn(textBtn: "Buscar Passagens")
                })
                Spacer()
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
        }
        .padding(.horizontal, 20)
    }
    
    var campoOrigem: some View {
        Section(header: Text("Origem")
            .foregroundStyle(Color.blackCustom)
            .font(.custom("Poppins-Medium", size: 15, relativeTo: .body))
            .padding(.horizontal, 5)
        ){
            VStack(alignment: .leading, spacing: 10){
                Menu{
                    ForEach(destinationOptions, id: \.self) { city in
                        Button(city) {
                            self.origin = city
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "airplane.departure")
                            .foregroundStyle(Color.blackCustom)
                        
                        Text(origin.isEmpty ? "São Paulo, GRU - Brasil" : origin)
                            .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                            .foregroundStyle(origin.isEmpty ? Color.cinzaClaro : Color.blackCustom)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.caption2)
                    }
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical)
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.gray, lineWidth: 1)
            }
        }
        .padding(.bottom, 5)
    }
    
    var campoDestino: some View {
        Section(header: Text("Destino")
            .foregroundStyle(Color.blackCustom)
            .font(.custom("Poppins-Medium", size: 15, relativeTo: .body))
            .padding(.horizontal, 5)
        ){
            VStack(alignment: .leading, spacing: 10){
                Menu{
                    ForEach(destinationOptions, id: \.self) { city in
                        Button(city) {
                            self.destination = city
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "airplane.arrival")
                            .foregroundStyle(Color.blackCustom)
                        
                        Text(destination.isEmpty ? "Rio de Janeiro, SDU - Brasil" : destination)
                            .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                            .foregroundStyle(destination.isEmpty ? Color.cinzaClaro : Color.blackCustom)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.caption2)
                    }
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical)
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.gray, lineWidth: 1)
            }
            .padding(.bottom, 15)
        }
    }
    
    var campoDatas: some View {
        Section{
            VStack{
                DatePicker(selection: $departureDate, displayedComponents: [.date]) {
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundStyle(Color.blackCustom)
                        Text("Data de Ida")
                            .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                            .foregroundStyle(Color.cinzaClaro)
                    }
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 10)
                .overlay{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding(.bottom, 15)
                
                DatePicker(selection: $returnDate, displayedComponents: [.date]) {
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundStyle(Color.blackCustom)
                        Text("Data de Volta")
                            .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                            .foregroundStyle(Color.cinzaClaro)
                    }
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 10)
                .overlay{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    var campoPassageirosEAssento: some View {
        Section{
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 10){
                    Text("Passageiros")
                        .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                        .foregroundStyle(Color.blackCustom)
                    
                    HStack{
                        Image(systemName: "person.fill")
                            .foregroundStyle(Color.blackCustom)
                        
                        Stepper(value: $passengers) {
                            Text("\(passengers)")
                                .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                                .foregroundStyle(.blackCustom)
                        }
                    }
                    .padding(.horizontal, 8)
                    .frame(height: 55)
                    //.padding(.vertical, 15)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Classe de Assento")
                        .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                        .foregroundStyle(.blackCustom)
                        .lineLimit(1)
                    
                    HStack{
                        Menu{
                            ForEach(assentosOptions, id: \.self) { assento in
                                Button(assento) {
                                    self.tripType = assento
                                }
                            }
                        } label: {
                            HStack(spacing: 5) {
                                Image(systemName: "sofa")
                                    .foregroundStyle(.blackCustom)
                                
                                Text(tripType.isEmpty ? "Escolha" : tripType)
                                    .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                                    .foregroundStyle(tripType.isEmpty ? Color.cinzaClaro : Color.blackCustom)
                                    .lineLimit(1)
                                    .fixedSize(horizontal: true, vertical: false)
                                
                                Spacer(minLength: 0)
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .frame(height: 55)
                    //.padding(.vertical, 20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
    
    var cardCupom: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Cupons de Voo")
                .font(.custom("Poppins-Regular", size: 14))
                .foregroundStyle(.black)
            
            HStack(spacing: 5) {
                Image(.descontoImg)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Descontos de até R$ 300,00")
                        .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                        .foregroundStyle(.blackCustom)
                    
                    Text("Pagamento posterior")
                        .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
                        .foregroundStyle(.cinzaClaro)
                }
                Spacer()
                Image(systemName: "info.circle")
                    .foregroundStyle(.black)
                    .font(.title2)
            }
            
            linhaPontilhada()
                .padding(.horizontal, -15)
            
            HStack{
                hashtagDesconto()
                hashtagDesconto(hashtag: "#VOECOMBORAI")
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    BuscarPassagem()
}

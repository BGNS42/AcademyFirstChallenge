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
    @State private var showSuggestions: Bool = false
    
    //let tripTypes = ["Somente Ida", "Ida e Volta"]
    let destinationOptions: [String] = ["Rio de Janeiro, SDU", "São Paulo, GRU"]
    let assentosOptions: [String] = ["Econômica", "Executiva"]
    
    var body: some View {
        VStack {
            
            headerSection(pageTitle: "Comprar Passagem", pageIcon: "buyTicketImg")
            
            Spacer()
            
            formBuscaVoo
            
            VStack{
                //Text("Escolha seu destino")
//                NavigationLink(destination: VoosIda(), label: {
//                    boraiBtn(textBtn: <#T##String#>, txtColor: <#T##String#>, btnColor: <#T##String#>)
//                })
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
    }
    
    var formBuscaVoo: some View {
        VStack(alignment: .leading, spacing: 5){
            Section(header: Text("Origem") // CAMPO ORIGEM
                .foregroundColor(Color("blackCustom"))
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
                                .foregroundColor(Color("blackCustom"))
                            
                            Text(origin.isEmpty ? "São Paulo, GRU - Brasil" : origin)
                                .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                                .foregroundColor(origin.isEmpty ? Color("cinzaClaro") : Color("blackCustom"))
                            
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
            
            Section(header: Text("Destino") // CAMPO DESTINO
                .foregroundColor(Color("blackCustom"))
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
                                .foregroundColor(Color("blackCustom"))
                            
                            Text(destination.isEmpty ? "Rio de Janeiro, SDU - Brasil" : destination)
                                .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                                .foregroundColor(destination.isEmpty ? Color("cinzaClaro") : Color("blackCustom"))
                            
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
                .padding(.bottom, 20)
            }
            
            Section{ // CAMPO DATAS
                VStack{
                    DatePicker(selection: $departureDate, displayedComponents: [.date]) {
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundColor(Color("blackCustom"))
                            Text("Data de Ida")
                                .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                                .foregroundColor(Color("cinzaClaro"))
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                    
                    DatePicker(selection: $returnDate, displayedComponents: [.date]) {
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundColor(Color("blackCustom"))
                            Text("Data de Volta")
                                .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                                .foregroundColor(Color("cinzaClaro"))
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                }
            }
            
            Section{ // PASSAGEIROS E ASSENTO ECONOMICO
                HStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Passageiros")
                            .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                            .foregroundColor(Color("blackCustom"))
                        
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("blackCustom"))
                            
                            Stepper(value: $passengers) {
                                Text("\(passengers)")
                                    .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                                    .foregroundColor(Color("cinzaClaro"))
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 15)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                        }
                        .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Classe de Assento")
                            .font(.custom("Poppins-Regular", size: 15, relativeTo: .body))
                            .foregroundColor(Color("blackCustom"))
                        
                        HStack{
                            Menu{
                                ForEach(assentosOptions, id: \.self) { assento in
                                    Button(assento) {
                                        self.tripType = assento
                                    }
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "sofa")
                                        .foregroundColor(Color("blackCustom"))
                                    
                                    Text(tripType.isEmpty ? "Escolha" : tripType)
                                        .font(.custom("Poppins-Regular", size: 16, relativeTo: .body))
                                        .foregroundColor(tripType.isEmpty ? Color("cinzaClaro") : Color("blackCustom"))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .font(.caption2)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 20)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            HStack(alignment: .center){
                Spacer()
                NavigationLink(destination: VoosIda(), label: {
                    boraiBtn(textBtn: "Buscar Voo", txtColor: "offWhite", btnColor: "azulEscuro")
                })
                Spacer()
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


struct headerSection: View {
    var pageTitle: String = "Page Title"
    var pageIcon: String
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
                    .font(.title)
                    .opacity(0)
                
                Spacer()
                
                VStack {
                    Image(pageIcon)
                    
                    Text(pageTitle)
                        .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                        .foregroundColor(Color("offWhite"))
                }
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
                    .font(.title)
            }
            .padding()
        }
        .padding(.horizontal)
        .padding(.top, -70) // PADDING PRA POSICIONAR HEADER NA MESMA LINHA DO BOTAO DE VOLTAR
    }
}

#Preview {
    BuscarPassagem()
}

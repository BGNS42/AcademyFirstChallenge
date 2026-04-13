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
    @State private var tripType = "Ida e Volta"
    @State private var passengers = 1
    @State private var showSuggestions: Bool = false
    
    let tripTypes = ["Somente Ida", "Ida e Volta"]
    let destinationOptions: [String] = ["Rio de Janeiro, SDU", "São Paulo, GRU", "Salvador, SSA", "Belo Horizonte, CNF", "Fortaleza, FOR", "Curitiba, CWB"]
    
    var filteredDestinations: [String] {
        destinationOptions.filter {
            $0.lowercased().contains(origin.lowercased()) && origin != $0
        }
    }
    
    var body: some View {
        VStack {
            
            headerSection(pageTitle: "Comprar Passagem", pageIcon: "buyTicketImg")
            
            formBuscaVoo
            
            VStack{
                Text("Escolha seu destino")
                NavigationLink(destination: VoosIda(), label: {
                    Text("Buscar Passagem")
                })
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
    }

    var formBuscaVoo: some View {
        VStack{
            Form {
                Section(header: Text("Origem")
                    .foregroundColor(Color("blackCustom"))
                    .font(.custom("Poppins-Medium", size: 15, relativeTo: .body))
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
                }
                Section(header: Text("Destino")
                    .foregroundColor(Color("blackCustom"))
                    .font(.custom("Poppins-Medium", size: 15, relativeTo: .body))
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
                }
            }
        }
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
    }
}

#Preview {
    BuscarPassagem()
}

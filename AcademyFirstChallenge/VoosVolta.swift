//
//  VoosVolta.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosVolta: View {
    //@State private var vooSelecionado: String? = nil // armazena o voo selecionado
    @State var aeroBuscaIda: String = "GRU"
    @State var aeroBuscaVolta: String = "SDU"
    
    var body: some View {
        VStack{
            headerSection

            voosScrollView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
    }
    
    var headerSection: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
                    .opacity(0)
                
                Spacer()
                
                Text(aeroBuscaVolta) // Fazer ele observar a variável escolhida na tela anterior e mostrar aqui
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                Image("headerPlaneImg")
                Text(aeroBuscaIda)
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
            }
            .padding()
            
            HStack(alignment: .center, spacing: 10){
                Text("Voos de volta")
                    .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                
                Spacer()
                
                Image("filterIcon")
                Text("Filtros")
                    .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal)
        .padding(.top, -60)  // PADDING PRA POSICIONAR HEADER NA MESMA LINHA DO BOTAO DE VOLTAR
    }
    
    var voosScrollView: some View {
        ScrollView{
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "GOL", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX524", valor: "640,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "LATAM", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ762", valor: "690,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "AZUL", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9866", valor: "750,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "GOL", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX5244", valor: "640,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "LATAM", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ7624", valor: "690,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: EscolherBagagem()) {
                voosCard(companhiaAerea: "AZUL", aeroBuscaIda: $aeroBuscaVolta, aeroBuscaVolta: $aeroBuscaIda, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9863", valor: "750,00")
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}



#Preview {
    VoosVolta()
}

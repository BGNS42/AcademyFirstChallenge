//
//  VoosIda.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosIda: View {
    @State private var vooSelecionado: String? = nil // armazena o voo selecionado
    @State var aeroBuscaIda: String = "GRU"
    //@Binding var origin: String
    @State var aeroBuscaVolta: String = "SDU"
    //@State var destino: String
    
    @State private var mostrarNotificacao = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [Color("gradientTop"), Color("gradientBottom")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack{
                headerSection
                
                voosScrollView
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: gradientColors))
            
            if mostrarNotificacao {
                notificacaoView(mostrarNotificacao: $mostrarNotificacao)
                    .transition(.scale)
            }
        }
    }
    
    var headerSection: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundStyle(Color.offWhite)
                    .font(.title3)
                    .opacity(0)
                
                Spacer()
                
                Text(aeroBuscaIda) // Fazer ele observar a variável escolhida na tela anterior e mostrar aqui
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                Image("headerPlaneImg")
                Text(aeroBuscaVolta)
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                
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
            .padding()
            
            HStack(alignment: .center, spacing: 10){
                Text("Voos de ida")
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
        .padding(.top, -30)  // PADDING PRA POSICIONAR HEADER NA MESMA LINHA DO BOTAO DE VOLTAR
    }
    
    var voosScrollView: some View {
        ScrollView{
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "GOL", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX524", valor: "640,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "LATAM", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ762", valor: "690,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "AZUL", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9866", valor: "750,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "GOL", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX5244", valor: "640,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "LATAM", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ7624", valor: "690,00")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: VoosVolta()) {
                voosCard(companhiaAerea: "AZUL", aeroBuscaIda: $aeroBuscaIda, aeroBuscaVolta: $aeroBuscaVolta, horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9863", valor: "750,00")
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

enum AirlineInfo {
    case gol, azul, latam
    
    init(_ code: String){
        switch code.uppercased() {
        case "GOL": self = .gol
        case "AZUL": self = .azul
        default: self = .latam
        }
    }
    
    var fullName: String {
        switch self {
        case .gol: return "GOL Linhas Aéreas"
        case .azul: return "Azul Linhas Aéreas"
        case .latam: return "LATAM Airlines"
        }
    }
    
    var logoName: String {
        switch self {
        case .gol: return "GolLogo"
        case .azul: return "AzulLogo"
        case .latam: return "LatamLogo"
        }
    }
}

enum DestinationAirport {
    case gru, sdu, vazio
    
    init(_ code: String) {
        switch code.uppercased() {
        case "SDU": self = .sdu
        case "GRU": self = .gru
        default: self = .vazio
        }
    }
    
    var sigla: String {
        switch self {
        case .sdu: return "SDU"
        case .gru: return "GRU"
        case .vazio: return "-"
        }
    }
    
    var cityName: String {
        switch self {
        case .sdu: return "Rio de Janeiro"
        case .gru: return "São Paulo"
        case .vazio: return "-"
        }
    }
}

struct voosCard: View {
    @State var companhiaAerea: String
    @Binding var aeroBuscaIda: String
    @Binding var aeroBuscaVolta: String

    let horarioSaida: String
    let horarioChegada: String
    let dataSaida: String
    let dataChegada: String
    
    let codigoVoo: String
    let valor: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .clipShape(TicketCutoutShape(), style: FillStyle(eoFill: true))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            infosDeCima(codigoCompanhia: companhiaAerea, codigoAirportIda: aeroBuscaIda, codigoAirportVolta: aeroBuscaVolta, horarioSaida: horarioSaida, horarioChegada: horarioChegada, dataSaida: dataSaida, dataChegada: dataChegada)
                .padding()
                .padding(.bottom, 40)
            
            linhaPontilhada()
                .padding(.top, 25)
                .padding(.horizontal, 20)
            
            infosDeBaixo(codigoVoo: codigoVoo, valor: valor)
                .padding()
                .padding(.top, 100)
            
        }
        .frame(width: 375, height: 191)
        //.contentShape(Rectangle()) // pra tentar deixar slecionável
        .padding()
    }
}

struct infosDeCima: View {
    let codigoCompanhia: String
    let codigoAirportIda: String
    let codigoAirportVolta: String
    
    let horarioSaida: String
    let horarioChegada: String
    let dataSaida: String
    let dataChegada: String
    
    private var airline: AirlineInfo {
        AirlineInfo(codigoCompanhia)
    }
    
    private var airportIda: DestinationAirport {
        DestinationAirport(codigoAirportIda)
    }
    private var airportVolta: DestinationAirport {
        DestinationAirport(codigoAirportVolta)
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text(airline.fullName)
                    .font(.custom("Poppins-Medium", size: 17, relativeTo: .body))
                
                Spacer()
                
                Image(airline.logoName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 68, maxHeight: 21)
            }
            
            HStack {
                campoTexto(aeroporto: airportIda.sigla, cidade: airportIda.cityName, data: dataSaida, hora: horarioSaida)
                
                VStack(spacing: 0) {
                    Image("airplane1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 60)
                }
                .frame(maxWidth: .infinity)
                
                campoTexto(aeroporto: airportVolta.sigla, cidade: airportVolta.cityName, data: dataChegada, hora: horarioChegada)
            }
            .padding(.bottom, 30)
        }
    }
}
    
struct infosDeBaixo: View {
    let codigoVoo: String
    let valor: String
    
        var body: some View {
            HStack{
                Text(codigoVoo)
                    .font(.custom("Poppins-Medium", size: 13, relativeTo: .body))
                    .foregroundColor(Color("blackCustom"))
                
                Text("Reembolsável")
                    .font(.custom("Poppins-Medium", size: 11, relativeTo: .body))
                    .foregroundColor(Color("azulEscuro"))
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("cinzaClaro"), lineWidth: 0.5)
                    )
                
                Text("Econômica")
                    .font(.custom("Poppins-Medium", size: 11, relativeTo: .body))
                    .foregroundColor(Color("azulEscuro"))
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("cinzaClaro"), lineWidth: 0.5)
                    )
                
                Text("R$ \(valor)")
                    .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                    .foregroundColor(Color("azulEscuro"))
            }
            .frame(maxWidth: .infinity)
        }
}
    


struct campoTexto: View {
    let aeroporto: String
    let cidade: String
    let data: String
    let hora: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            HStack{
                Text(aeroporto)
                    .font(.custom("Poppins-SemiBold", size: 16, relativeTo: .body))
                
                Spacer()
                
                Text(cidade)
                    .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            HStack{
                Text(data)
                    .font(.custom("Poppins-Regular", size: 13, relativeTo: .body))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Spacer()
                
                Text(hora)
                    .font(.custom("Poppins-Regular", size: 13, relativeTo: .body))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct TicketCutoutShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.addRect(rect)
        
        
        let radius: CGFloat = 15 // Aumenta o tamanho dos círculos do ticket
        let midY = rect.height * 0.57
        
        let leftHole = CGRect(x: -radius, y: midY - radius, width: radius * 2, height: radius * 2)
        let rightHole = CGRect(x: rect.width - radius, y: midY - radius, width: radius * 2, height: radius * 2)
        
        
        path.addEllipse(in: leftHole)
        path.addEllipse(in: rightHole)
        return path
        
        
    }
}

#Preview {
//    VoosIda(origin: .constant("GRU"))
    VoosIda()
}

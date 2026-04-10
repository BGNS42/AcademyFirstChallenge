//
//  VoosIda.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosIda: View {
    @State private var vooSelecionado: String? = nil // armazena o voo selecionado
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
                    .opacity(0)
                
                Spacer()
                
                Text("GRU") // Fazer ele observar a variável escolhida na tela anterior e mostrar aqui
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                Image("headerPlaneImg")
                Text("SDU")
                    .font(.custom("Poppins-Medium", size: 16, relativeTo: .body))
                    .foregroundColor(Color("offWhite"))
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(Color("offWhite"))
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
            
            ScrollView{
                voosCard(companhiaAerea: "GOL", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX524", valor: "640,00")
                    .overlay( // pra tentar deixar selecionável
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(vooSelecionado == "CX524" ? Color("azulEscuro") : Color.clear, lineWidth: 3)
                    )
                
                voosCard(companhiaAerea: "LATAM", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ762", valor: "690,00")
                
                voosCard(companhiaAerea: "AZUL", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9866", valor: "750,00")

                voosCard(companhiaAerea: "GOL", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "CX524", valor: "640,00")
                
                voosCard(companhiaAerea: "LATAM", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "SQ762", valor: "690,00")
                
                voosCard(companhiaAerea: "AZUL", aeroSaida: "GRU",cidadeSaida: "São Paulo", aeroChegada: "SDU", cidadeChegada: "Rio de Janeiro", horarioSaida: "10:20", horarioChegada: "11:20", dataSaida: "Abr 27", dataChegada: "Abr 27", codigoVoo: "QR9866", valor: "750,00")
            }
            
            Text("Escolher Voo de Ida")
            NavigationLink(destination: VoosVolta(), label: {
                boraiBtn(textBtn: "Proximo", txtColor: "offWhite", btnColor: "azulEscuro")
            })
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
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

struct voosCard: View {
    @State var companhiaAerea: String
    let aeroSaida: String
    let cidadeSaida: String
    let aeroChegada: String
    let cidadeChegada: String
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
            
            infosDeCima(codigoCompanhia: companhiaAerea, aeroSaida: aeroSaida,cidadeSaida: cidadeSaida, aeroChegada: aeroChegada, cidadeChegada: cidadeChegada, horarioSaida: horarioSaida, horarioChegada: horarioChegada, dataSaida: dataSaida, dataChegada: dataChegada)
                .padding()
                .padding(.bottom, 40)
            
            linhaPontilhada
                .padding(.top, 25)
                .padding(.horizontal, 20)
            
            infosDeBaixo(codigoVoo: codigoVoo, valor: valor)
                .padding()
                .padding(.top, 100)
            
        }
        .frame(width: 375, height: 191)
        .contentShape(Rectangle()) // pra tentar deixar slecionável
        .padding()
    }
    
    var linhaPontilhada: some View {
        GeometryReader { geo in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
            }
            .stroke(
                Color.gray.opacity(0.7),
                style: StrokeStyle(
                    lineWidth: 1,
                    dash: [6, 4]
                )
            )
        }
        .frame(height: 1)
        .padding(.vertical, 8)
    }
}

struct infosDeCima: View {
    let codigoCompanhia: String
    
    let aeroSaida: String
    let cidadeSaida: String
    let aeroChegada: String
    let cidadeChegada: String
    let horarioSaida: String
    let horarioChegada: String
    let dataSaida: String
    let dataChegada: String
    
    private var airline: AirlineInfo {
        AirlineInfo(codigoCompanhia)
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
                campoTexto(aeroporto: aeroSaida, cidade: cidadeSaida, data: dataSaida, hora: horarioSaida)
                
                VStack(spacing: 0) {
                    Image("airplane1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 60)
                }
                .frame(maxWidth: .infinity)
                
                campoTexto(aeroporto: aeroChegada, cidade: cidadeChegada, data: dataChegada, hora: horarioChegada)
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
    VoosIda()
}

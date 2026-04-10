//
//  VoosIda.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct VoosIda: View {
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
                voosCard()
                voosCard()
                voosCard()
                voosCard()
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

struct voosCard: View {
//    var companhiaAerea: String
//    var
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .clipShape(TicketCutoutShape(), style: FillStyle(eoFill: true))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            infosDeCima()
                .padding()
                .padding(.bottom, 40)
            
            linhaPontilhada
                .padding(.top, 25)
                .padding(.horizontal, 20)
            
            infosDeBaixo()
                .padding()
                .padding(.top, 100)
            
        }
        .frame(width: 375, height: 191)
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
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("GOL Linhas Aéreas")
                    .font(.custom("Poppins-Medium", size: 17, relativeTo: .body))
                
                Spacer()
                
                Image("GolLogo")
                    .resizable()
                    .frame(width: 42, height: 24)
            }
            
            HStack {
                campoTexto()
                
                VStack(spacing: 0) {
                    Image("airplane1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 60)
                }
                .frame(maxWidth: .infinity)
                
                campoTexto()
            }
            .padding(.bottom, 30)
        }
    }
}
    
struct infosDeBaixo: View {
        var body: some View {
            HStack{
                Text("CX524")
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
                
                Text("R$ 690,00")
                    .font(.custom("Poppins-Medium", size: 13, relativeTo: .body))
                    .foregroundColor(Color("azulEscuro"))
            }
            .frame(maxWidth: .infinity)
        }
}
    


struct campoTexto: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("GRU")
                    .font(.custom("Poppins-SemiBold", size: 16, relativeTo: .body))
                
                Spacer()
                
                Text("São Paulo")
                    .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            HStack{
                Text("Abr 27")
                    .font(.custom("Poppins-Regular", size: 13, relativeTo: .body))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Spacer()
                
                Text("10:20")
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

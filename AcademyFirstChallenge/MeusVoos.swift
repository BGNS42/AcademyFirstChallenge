//
//  MeusVoos.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct MeusVoos: View {
    var body: some View {
        ZStack {
            LinearGradient (colors: [Color("gradientTop"), Color("gradientBottom")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                
                header
               ticketCard
                Spacer()
                
            }
        }
       
    } //var body
    var header: some View {
        ZStack {
            

            
            HStack {
                Button {
                    print("Voltar") }
                label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.white)
                        .opacity(0)
                        
                }
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "airplane")
                        .foregroundStyle(Color.white)
                    
                    Text("Seus Voos")
                        .font(.custom("Poppins-SemiBold", size: 16.0))
                        .foregroundStyle(Color.white)
                }
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
            
            }
            .padding(.horizontal)
            .padding(.top, -60)
        }
        
        .frame(height: 140)
    } // var header
    var ticketCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .clipShape(TicketCutoutShape(), style: FillStyle(eoFill: true))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            
                
            VStack(spacing: 24) {
                
                
                HStack {
                    Image("LatamLogo")
                        .resizable()
                        .frame(width: 80, height: 24)
                    
                    Spacer()
                    
                    Text("CX524")
                        .font(.custom("Poppins-SemiBold", size: 14))
                }
                
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("GRU")
                            .font(.custom("Poppins-SemiBold", size: 20))
                        
                        Text("São Paulo")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image("airplane1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 60)
                        Text("1h 30m")
                            .font(.custom("Poppins-Medium", size: 12))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("SDU")
                            .font(.custom("Poppins-SemiBold", size: 20))
                        
                        Text("Rio de Janeiro")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                
                HStack {
                    infoBox(title: "Classe                                      ", value: "Econômica")
                    infoBox(title: "Partida", value: "Abr 27        |       10:20")
                }
                
                HStack {
                    infoBox(title: "Passageiros                         ", value: "2")
                    infoBox(title: "Chegada", value: "Abr 27         |        11:50")
                }
                
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .padding(.vertical, 8)
                
                
                HStack {
                    
                    Image("QRCode")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Portão ")
                            .font(.custom("Poppins-Medium", size: 18))
                        +
                        Text("C7")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(Color("azulEscuro"))
                        Text("Terminal ")
                            .font(.custom("Poppins-Medium", size: 18))
                        +
                        Text("1")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(Color("azulEscuro"))
                        Text("Embarque ")
                            .font(.custom("Poppins-Medium", size: 18))
                        +
                        Text("Grupo 6")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(Color("azulEscuro"))
                        
                    }
                    Spacer()
                }
                
                .padding()
                Button {
                    print("Baixar Ticket")
                } label: {
                    Text("Baixar Ticket")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("gradientTop"))
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.2), radius: 8)
                }
            }
            .padding()
        }
        .padding(.horizontal, 20)
        .offset(y: -45)
    } //var ticket
    
    func infoBox(title: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 10))
                .foregroundColor(.gray)
            
            Text(value)
                .font(.custom("Poppins-Regular", size: 12))
            
        }
        .frame(maxWidth: 200)
        .padding(8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
    struct TicketCutoutShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
          
            path.addRect(rect)
            
        
            let radius: CGFloat = 15
            let midY = rect.height * 0.57
            
            let leftHole = CGRect(x: -radius, y: midY - radius, width: radius * 2, height: radius * 2)
            let rightHole = CGRect(x: rect.width - radius, y: midY - radius, width: radius * 2, height: radius * 2)
            
            
            path.addEllipse(in: leftHole)
            path.addEllipse(in: rightHole)
            return path
            
            
        }
    }
    
}

#Preview {
    MeusVoos()
}

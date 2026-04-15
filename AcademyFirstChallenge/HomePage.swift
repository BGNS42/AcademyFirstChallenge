//
//  HomePage.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct HomePage: View {
    @State private var mostrarNotificacao = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [Color("gradientTop"), Color("gradientBottom")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                headerSection
                
                servicesOptions
                
                carrosselPromo
            }
            .background(Color("offWhite"))
            
            if mostrarNotificacao {
                notificacaoView(mostrarNotificacao: $mostrarNotificacao)
                    .transition(.scale)
            }
        }
    }
}

private extension HomePage {
    var headerSection: some View {
        ZStack{
            Image("headerHome")
                .resizable()
                //.aspectRatio(contentMode: .fit) // Faz quebrar ao dar padding em outros lugares
                .overlay(Color("azulEscuro")
                    .opacity(0.5)
                    .cornerRadius(40)
                    .blendMode(.plusDarker)
                )
            
            VStack{
                HStack(alignment: .center){
                    //Spacer()
                    Image(systemName: "bell.fill")
                        .frame(alignment: .trailing)
                        .font(.title3)
                        .opacity(0)
                    
                    Spacer()
                    
                    Text("Bem-vindo(a), *****")
                        //.font(.subheadline)
                        .font(.custom("Poppins-Medium", size: 15.0))
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
                    
                    //Spacer()
                        
                }
                .padding()
                .padding(.bottom, 30)
                .padding(.horizontal, 10)
                
                Text("Aqui você encontra as\nmelhores ofertas para viajar")
                    .multilineTextAlignment(.center)
                    .font(.custom("Poppins-Bold", size: 20))
                    .padding(.bottom, 30)
                    .foregroundColor(Color("offWhite"))
                    //.fontWeight(.bold)
                    //.font(.title3)
                
                NavigationLink(destination: BuscarPassagem(), label: {
                    Text("COMPRAR PASSAGENS")
                        .foregroundColor(Color.white)
                        .font(.custom("Poppins-Regular", size: 15.0))
                        .padding()
                        .background{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("btnVermelho"))
                        }
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: -3, y: 8)
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        //.padding(.bottom)
        
    }
    
    var servicesOptions: some View {
        VStack{
            Text("O que você está procurando?")
                .font(.custom("Poppins-Medium", size: 17.0))
                //.font(.title3)
            
            HStack{
                VStack{
                    NavigationLink(destination: BuscarPassagem(), label: {
                        Image(systemName: "airplane")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                Color("btnLaranja"),
                                in: Circle(),
                            )
                        
                    })
                    Text("Passagens")
                        .font(.custom("Poppins-Regular", size: 12.0))
                        //.font(.footnote)
                }
                .frame(maxWidth: .infinity)
                btnRedondo(btnColor: .btnVerde, btnLabel: "Hospedagem", btnIcon: "bed.double.fill")
                btnRedondo(btnColor: .btnAzul, btnLabel: "Pacotes", btnIcon: "briefcase.fill")
                btnRedondo(btnColor: .btnVermelho, btnLabel: "Ofertas", btnIcon: "flame")
            }
        }
        .padding()
        .padding(.bottom, 10)
    }
    
    var carrosselPromo: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Vale a pena conhecer! Promoções imperdíveis")
                .font(.custom("Poppins-SemiBold", size: 14.0))
                .padding(.horizontal)
                .foregroundColor(Color("cinzaClaro"))
                //.fontWeight(.semibold)
                //.font(.subheadline)
                .padding(.leading, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 15){
                    promoCard(cardTur: "Jardim Botânico", cardDest: "Curitiba", cardData: "27 Nov", cardPreco: "320,00", imgDestino: "destino1")
                    promoCard(cardTur: "Fernando de Noronha", cardDest: "Pernambuco", cardData: "05 Abr", cardPreco: "400,00", imgDestino: "destino2")
                    promoCard(cardTur: "Cristo Redentor", cardDest: "Rio de Janeiro", cardData: "10 Fev", cardPreco: "350,00", imgDestino: "destino3")
                    promoCard(cardTur: "Parque Ibirapuera", cardDest: "São Paulo", cardData: "22 Jun", cardPreco: "410,00", imgDestino: "destino4")
                }
            }
            .scrollTargetLayout()
            //.scrollTargetBehavior(.paging)
            //.containerRelativeFrame(.horizontal)
        }
        .contentMargins(.horizontal, 20, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

//struct btnRedondo: View {
//    var btnColor: String
//    var btnLabel: String
//    var btnIcon: String
//    
//    var body: some View {
//        VStack{
//            Image(systemName: btnIcon)
//                .padding()
//                .foregroundColor(.white)
//                .background(
//                    Color(btnColor),
//                    in: Circle(),
//                )
//            
//            Text(btnLabel)
//                .font(.custom("Poppins-Regular", size: 12.0))
//                .font(.footnote)
//        }
//        .frame(maxWidth: .infinity)
//    }
//}

struct promoCard: View {
    var cardTur: String
    var cardDest: String
    var cardData: String
    var cardPreco: String
    var imgDestino: String
    
    var body: some View {
        VStack(spacing: 0){
            Image(imgDestino)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 150)
                .clipped()
            
            VStack(alignment: .center, spacing: 8){
                Text(cardTur)
                    .font(.custom("Poppins-SemiBold", size: 10.0))
                    //.font(.caption)
                    //.bold()
                    .lineLimit(1)
                
                HStack{
                    Image(systemName: "location.circle.fill")
                        .font(.footnote)
                    Text(cardDest)
                        .font(.custom("Poppins-Regular", size: 10.0))
                        //.font(.caption2)
                        .lineLimit(1)
                        .layoutPriority(1)
                    
                    Spacer(minLength: 5)
                    
                    Image(systemName: "calendar")
                        .font(.footnote)
                    Text(cardData)
                        .font(.custom("Poppins-Regular", size: 10.0))
                        //.font(.caption2)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false) // garante que a data n quebre
                }
                
                Text("R$ \(cardPreco)")
                    .font(.custom("Poppins-SemiBold", size: 12.0))
                    //.font(.caption)
                    //.bold()
                    .padding(.top, 4)
            }
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .frame(width: 160)
        .cornerRadius(20)
        .shadow(radius: 1)
    }
}

#Preview {
    HomePage()
}

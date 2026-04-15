//
//  resumoDoPedido.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct ResumoDoPedido: View {
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
                
                headerSection(pageTitle: "Resumo do pedido", pageIcon: "", mostrarNotificacao: $mostrarNotificacao)
                    .padding(.top, 10)
                
                ScrollView{
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .clipShape(TicketCutoutShape2(), style: FillStyle(eoFill: true))
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                        
                        VStack{
                            HStack{
                                Image(.latamLogo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 71, maxHeight: 22)
                                //.padding(.horizontal, 30)
                                
                                Spacer()
                                
                                Image(.boraiLogo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 36, maxHeight: 27)
                                //.padding(.horizontal, 30)
                            }
                            
                            Spacer(minLength: 5)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("GRU")
                                        .font(.custom("Poppins-Medium", size: 20, relativeTo: .body))
                                        .foregroundStyle(Color(.black))
                                    
                                    Text("São Paulo")
                                        .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                                        .foregroundStyle(.cinzaClaro)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer(minLength: 5)
                                
                                VStack(spacing: 0) {
                                    Image("airplane1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 60)
                                }
                                .frame(maxWidth: .infinity)
                                
                                Spacer(minLength: 5)
                                
                                VStack(alignment: .trailing){
                                    Text("SDU")
                                        .font(.custom("Poppins-Medium", size: 20, relativeTo: .body))
                                        .foregroundStyle(Color(.black))
                                    
                                    Text("Rio de Janeiro")
                                        .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                                        .foregroundStyle(.cinzaClaro)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding(.vertical, 10)
                            
                            Spacer(minLength: 5)
                            
                            VStack(alignment: .leading){
                                Text("Ponto de Embarque: Aeroporto de Guarulhos")
                                    .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                                    .foregroundStyle(Color(.black))
                                    .padding(.bottom, 2)
                                
                                Text("**Pedro Augusto Alves** - **RG**: 4398593184 - **CPF:** 12345678901")
                                    .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                                    .foregroundStyle(Color(.cinzaClaro))
                                
                                Text("27/04/2026 às 13:00")
                                    .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                                    .foregroundStyle(Color(.cinzaClaro))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            linhaPontilhada()
                            //.padding(.top)
                                .padding(.horizontal, -5)
                            //.padding(.bottom, 20)
                            
                            HStack{
                                Text("Cupom de Voo")
                                    .font(.custom("Poppins-Regular", size: 14, relativeTo: .body))
                                    .foregroundStyle(.offWhite)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("ADICIONAR")
                                    .font(.custom("Poppins-SemiBold", size: 12, relativeTo: .body))
                                    .foregroundStyle(.black)
                                    .frame(width: 70, alignment: .center)
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.white)
                                    )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.azulEscuro)
                            )
                            .padding(.bottom, 30)
                            
                            VStack{
                                resumoPreco()
                                resumoPreco(title: "Desconto aplicado:", price: "R$ 0,00")
                                resumoPreco(title: "Método de pagamento:", price: "MasterCard 0831 em 5x sem juros")
                            }
                            .padding(.bottom, 50)
                            
                            linhaPontilhada(tracejado: [100,0.1])
                                .padding(.horizontal, -20)
                            
                            Text("R$ 981,55")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.custom("Poppins-Medium", size: 25, relativeTo: .body))
                            
                            NavigationLink(destination: PagamentoConfirmado(), label: {
                                boraiBtn(textBtn: "Confirmar Pedido", txtColor: .offWhite, btnColor: .azulEscuro)
                            })
                        }
                        .padding(20)
                        
                    }
                    //.frame(height: 600)
                }
                .padding(.horizontal, 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors:gradientColors))
            
            if mostrarNotificacao {
                notificacaoView(mostrarNotificacao: $mostrarNotificacao)
                    .transition(.scale)
            }
        }
        
    }
    
    struct TicketCutoutShape2: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
          
            path.addRect(rect)
            
        
            let radius: CGFloat = 15
            let midY = rect.height * 0.37
            
            let leftHole = CGRect(x: -radius, y: midY - radius, width: radius * 2, height: radius * 2)
            let rightHole = CGRect(x: rect.width - radius, y: midY - radius, width: radius * 2, height: radius * 2)
            
            
            path.addEllipse(in: leftHole)
            path.addEllipse(in: rightHole)
            return path
            
            
        }
    }
}

struct resumoPreco: View {
    var title: String = "Total:"
    var price: String = "R$ 981,55"
    
    var body: some View {
        HStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                .foregroundStyle(Color(.black))
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)
            
            Text(price)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                .foregroundStyle(Color(.cinzaClaro))
                .fixedSize(horizontal: false, vertical: true)
                //.multilineTextAlignment(.trailing)
        }
    }
}


#Preview {
    ResumoDoPedido()
}

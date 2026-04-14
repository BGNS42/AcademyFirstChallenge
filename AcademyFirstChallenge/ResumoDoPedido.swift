//
//  resumoDoPedido.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct ResumoDoPedido: View {
    var body: some View {
        VStack{
            
            headerSection(pageTitle: "Resumo do pedido", pageIcon: "")
            
            ScrollView{
                VStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .clipShape(TicketCutoutShape(), style: FillStyle(eoFill: true))
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                    
                    boraiBtn()
                    boraiBtn()
                }
            }
            
            Text("Veja o resumo do seu pedido")
            NavigationLink(destination: PagamentoConfirmado(), label: {
                Text("Confirmar seu pedido")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors:gradientColors))
    }
}

#Preview {
    ResumoDoPedido()
}

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

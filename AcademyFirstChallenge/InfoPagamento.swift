//
//  InfoPagamento.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct InfoPagamento: View {
    var body: some View {
        VStack{
            Text("Coloque as informações de Pagamento")
            NavigationLink(destination: ResumoDoPedido(), label: {
                Text("Confirmar dados de pagamento")
            })
        }
    }
}

#Preview {
    InfoPagamento()
}

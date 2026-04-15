//
//  PagamentoConfirmado.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct PagamentoConfirmado: View {
    @State private var isConcluded: Bool = false
    
    var body: some View {
        VStack{
            if isConcluded {
                HomePageNav()
            } else {
                finale
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    var finale: some View {
        Text("Seu pagamento foi concluído!")
        LoginButtons(textBtn: "Voltar para Home", txtColor: "googleWhite", btnColor: "azulEscuro") {
            isConcluded = true
        }
    }
}

#Preview {
    PagamentoConfirmado()
}

//
//  ResumoPedido.swift
//  AcademyFirstChallenge
//
//  Created by MARIANA FRACAROLI LOPES on 14/04/26.
//

import SwiftUI

struct ResumoPedido: View {
    var body: some View {
        VStack {
            Text("Informações do voo")
            NavigationLink(destination: PagamentoConfirmado(), label: {
                boraiBtn(textBtn: "Confirmar", txtColor: "offWhite", btnColor: "azulEscuro")})
        }
    }
}
#Preview {
    ResumoPedido()
}

//
//  boraiBtn.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 10/04/26.
//

import SwiftUI

struct boraiBtn: View {
    let textBtn: String
    let txtColor: String
    let btnColor: String
    
    var body: some View {
    
            HStack(alignment: .center){
                Text(textBtn)
            }
            .padding(15)
            .font(.custom("Poppins-Medium", size: 18))
            .foregroundColor(Color(txtColor))
            .frame(width: 264)
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(btnColor))
            }   .padding(.bottom, 5)
            .shadow(color: Color.black.opacity(0.15), radius: 1, x: -2, y: 2)
        }
     
    }




#Preview {
    boraiBtn(textBtn: "Entrar", txtColor: "offWhite", btnColor: "azulEscuro",)
}

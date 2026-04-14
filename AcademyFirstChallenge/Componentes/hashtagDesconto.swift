//
//  hashtagDesconto.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct hashtagDesconto: View {
    var hashtag: String = "#PRIMEIROVOO"
    var corBack: Color = .azulEscuro
    var corTxt: Color = .white
    
    
    var body: some View {
        Text(hashtag)
            .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
            .foregroundStyle(corTxt)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(corBack)
            )
    }
}


#Preview {
    hashtagDesconto()
}

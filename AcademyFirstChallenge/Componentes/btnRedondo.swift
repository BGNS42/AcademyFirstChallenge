//
//  btnRedondo.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 14/04/26.
//

import SwiftUI

struct btnRedondo: View {
    var btnColor: Color = .red
    var btnLabel: String = "Passagens"
    var btnIcon: String = "house.fill"
    
    var body: some View {
        VStack{
            Image(systemName: btnIcon)
                .padding()
                .foregroundColor(.white)
                .background(
                    Color(btnColor),
                    in: Circle(),
                )
            
            Text(btnLabel)
                .font(.custom("Poppins-Regular", size: 12.0))
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    btnRedondo()
}

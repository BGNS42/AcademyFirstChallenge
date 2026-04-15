//
//  StartView.swift
//  AcademyFirstChallenge
//
//  Created by MARIANA FRACAROLI LOPES on 14/04/26.
//

import SwiftUI

struct StartView: View {
    @State private var showLogin = false
    
    var body: some View {
        
        if !showLogin {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        showLogin = true
                        
                    }
                }
        } else {
            Login()
        }
        
    }
}

#Preview {
    StartView()
        .ignoresSafeArea()

}

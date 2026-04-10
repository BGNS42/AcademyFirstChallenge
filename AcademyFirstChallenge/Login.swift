//
//  Login.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct Login: View {
    @State private var isLoggedIn: Bool = false
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            if isLoggedIn {
                ContentView()
            } else {
                LoginFormView(isLoggedIn: $isLoggedIn, showingAlert: $showingAlert)
            }
        }
    }
}

#Preview {
    Login()
}

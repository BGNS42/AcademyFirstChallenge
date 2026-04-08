//
//  Login.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var senha: String = ""
    @State var showPassword: Bool = true
    @State private var isLoggedIn: Bool = false
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                if isLoggedIn {
                    HomePage()
                } else {
                    LoginFormView(email: $email,
                                  senha: $senha,
                                  showPassword: $showPassword,
                                  isLoggedIn: $isLoggedIn,
                                  showingAlert: $showingAlert
                    )
                }
            }
        }
    }
}

#Preview {
    Login()
}

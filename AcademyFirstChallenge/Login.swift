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
                    ContentView()
                } else {
                    loginForm
                }
            }
            .background(Gradient(colors:gradientColors))
        }
    }
    
    var loginForm: some View {
            VStack(alignment: .leading, spacing: 15) {
                //Spacer()
                
                HStack(alignment: .center) {
//                    Image("BandeiraIdioma")
//                        .font(.subheadline)
//                        .opacity(0)
                    Spacer()
                    Image("LogoBorai")
                        .font(.largeTitle)
                        .foregroundColor(Color.yellow)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, -40)
                    
                    //Spacer()
                    
                    Image("BandeiraIdioma")
                        .font(.subheadline)
//                    .frame(alignment: .trailing)
                }
                
                VStack(alignment: .leading){
                    Text("Faça o login")
                        .padding(.bottom, 30)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .font(.title)
                    
                    // USERNAME FIELD
                    Text("E-mail")
                        .padding(.horizontal, 10)
                        .fontWeight(.bold)
                    
                    HStack{
                        //Image(systemName: "person.fill").foregroundColor(.black)
                        
                        TextField("Username",
                                  text: $email,
                                  prompt: Text(verbatim: "ex: seu@email.com.br").foregroundColor(.gray)
                        )
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    }
                    .padding(10)
                    .overlay{
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.gray, lineWidth: 1)
                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: -1, y: 3)
                    }
                    
                    .padding(.bottom, 10)
                    
                    // PASSWORD FIELD
                    Text("Senha")
                        .padding(.horizontal, 10)
                        .fontWeight(.bold)
                    
                    HStack{
                        //Image(systemName: "lock.fill").foregroundColor(.black)
                        
                        Group{
                            if showPassword {
                                SecureField("Password",
                                            text: $senha,
                                            prompt: Text("********").foregroundColor(.gray))
                            } else {
                                TextField("Password", text: $senha, prompt: Text("Sua Senha").foregroundColor(.red))
                            }
                            
                            Button{
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye").foregroundColor(.black)
                            }
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    }
                    .padding(10)
                    .overlay{
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.gray, lineWidth: 1)
                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: -1, y: 3)
                    }
                    
                    Text("Esqueci minha senha")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 30)
                    
                    LoginButtons(textBtn: "Entrar", txtColor: "GradientBot", btnColor: "GradientTop") {
                        print("Tentando logar...")
                        if senha == "" && email == "" {
                            isLoggedIn = true
                            print("Logado com sucesso!")
                        } else {
                            print("Dados incorretos")
                            showingAlert = true
                        }
                    }
                    .alert("Dados Inválidos", isPresented: $showingAlert) {
                        Button("Ok", role: .cancel) {}
                    } message: {
                        Text("Dados de login inválidos, tente não preencher nada e tentar novamente.")
                    }
                    
                    Text("Ou")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fontWeight(.semibold)
                    
                    LoginButtons(textBtn: "Continuar com a Apple", txtColor: "GradientBot", btnColor: "AppleBlack") {
                        print("Tentando logar...")
                        if senha == "" && email == "" {
                            isLoggedIn = true
                            print("Logado com sucesso!")
                        } else {
                            print("Dados incorretos")
                            showingAlert = true
                        }
                        print("logou com a Apple")
                    }
                    
                    LoginButtons(textBtn: "Continuar com o Google", txtColor: "GradientTop", btnColor: "GradientBot") {
                        print("Tentando logar...")
                        if senha == "" && email == "" {
                            isLoggedIn = true
                            print("Logado com sucesso!")
                        } else {
                            print("Dados incorretos")
                            showingAlert = true
                        }
                        print("Logou com o Google")
                    }
                    .padding(.bottom, 20)
                    
                    Text("Não tem uma conta? **Cadastre-se**")
                        .underline()
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                    
                }
                .padding(30)
                .padding(.bottom, 20)
                .background{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                }
                
                Spacer()
            }
            .padding()
        }
}

struct LoginButtons: View {
    let textBtn: String
    let txtColor: String
    let btnColor: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(alignment: .center){
                if textBtn == "Continuar com a Apple" {
                    Image("logoApple")
                        //.resizable()
                        //.scaledToFit()
                        .frame(width: 15, height: 15)
                        //.padding(.trailing, -3)
                }
                if textBtn == "Continuar com o Google" {
                    Image("logoGoogle")
                        //.resizable()
                        //.scaledToFit()
                        .frame(width: 20, height: 20)
                        //.padding(.trailing, -5)
                }
                Text(textBtn)
            }
            .padding(5)
            .fontWeight(.semibold)
            .foregroundColor(Color(txtColor))
            .frame(width: 310)
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(btnColor))
            }
        }
        .shadow(color: Color.black.opacity(0.15), radius: 1, x: -2, y: 2)
        .padding(.bottom, 5)
    }
}

#Preview {
    Login()
}

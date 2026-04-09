//
//  LoginFormView.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 08/04/26.
//

import SwiftUI

struct LoginFormView: View {
    @State var email: String = ""
    @State var senha: String = ""
    @State var showPassword: Bool = true
    @Binding var isLoggedIn: Bool
    @Binding var showingAlert: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            headerSection
            
            VStack(alignment: .leading){
                Text("Faça o login")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .padding(.bottom, 30)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    //.font(.title)
                
                // USERNAME FIELD
                emailField
                
                // PASSWORD FIELD
                passwordField
                
                // ESQUECI MINHA SENHA
                forgetPasswordButton
                
                LoginButtons(textBtn: "Entrar", txtColor: "offWhite", btnColor: "azulEscuro") {
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
                
                socialButtons
                
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
        .background(Gradient(colors:gradientColors))
    }
}

private extension LoginFormView {
    var headerSection: some View {
        HStack(alignment: .center) {
            //                    Image("BandeiraIdioma")
            //                        .font(.subheadline)
            //                        .opacity(0)
            Spacer()
            Image("boraiLogo")
                .font(.largeTitle)
                .foregroundColor(Color.yellow)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.trailing, -40)
            
            //Spacer()
            
            Image("bandeiraIdioma")
                .font(.subheadline)
            //                    .frame(alignment: .trailing)
        }
    }
    
    var emailField: some View {
        VStack(alignment: .leading) {
            Text("E-mail")
                .font(.custom("Poppins-Bold", size: 16.0))
                .padding(.horizontal, 10)
                //.fontWeight(.bold)
            
            TextField("Username",
                      text: $email,
                      prompt: Text(verbatim: "ex: seu@email.com.br").foregroundColor(.gray).font(.custom("Poppins-Regular", size: 14.0))
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(10)
            .overlay{
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.gray, lineWidth: 1)
                    .shadow(color: Color.black.opacity(0.5), radius: 3, x: -1, y: 3)
            }
        }
        .padding(.bottom, 10)
    }
    
    var passwordField: some View {
        VStack(alignment: .leading) {
            Text("Senha")
                .font(.custom("Poppins-Bold", size: 16))
                .padding(.horizontal, 10)
                //.fontWeight(.bold)
            
            HStack{
                if showPassword {
                    SecureField("Password",
                                text: $senha,
                                prompt: Text("********").foregroundColor(.gray)).font(.custom("Poppins-Regular", size: 14.0))
                } else {
                    TextField("Password",
                              text: $senha,
                              prompt: Text("Sua Senha").foregroundColor(.red)).font(.custom("Poppins-Regular", size: 14.0))
                }
                Button{
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye").foregroundColor(.black)
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
        }
    }
    
    var forgetPasswordButton: some View {
        Text("Esqueci minha senha")
            .font(.custom("Poppins-SemiBold", size: 14.0))
            //.font(.subheadline)
            //.fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, 30)
    }
    
    var socialButtons: some View {
        Group{
            Text("Ou")
                .font(.custom("Poppins-SemiBold", size: 14.0))
                //.font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .center)
                //.fontWeight(.semibold)
            
            LoginButtons(textBtn: "Continuar com a Apple", txtColor: "offWhite", btnColor: "appleBlack") {
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
            
            LoginButtons(textBtn: "Continuar com o Google", txtColor: "azulEscuro", btnColor: "googleWhite") {
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
            Text("Não tem uma conta? **Cadastre-se**")
                .font(.custom("Poppins-Regular", size: 13.0))
                .underline()
                //.font(.caption)
                .frame(maxWidth: .infinity)
        }
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
            .font(.custom("Poppins-Medium", size: 16.0))
            //.fontWeight(.semibold)
            .foregroundColor(Color(txtColor))
            .frame(width: 310)
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(btnColor))
            }
        }
        .padding(.bottom, 5)
        .shadow(color: Color.black.opacity(0.15), radius: 1, x: -2, y: 2)
    }
}

#Preview {
    LoginFormView(isLoggedIn: .constant(false), showingAlert: .constant(false))
}

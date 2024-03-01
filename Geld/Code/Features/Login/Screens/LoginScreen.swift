//
//  LoginScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/02/24.
//

import SwiftUI

private enum FocusableField: Hashable
{
    case email
    case password
}

struct LoginScreen: View
{
    @FocusState private var focus: FocusableField?
    @EnvironmentObject var viewModelLogin: LoginViewModel
    
    var body: some View
    {
        VStack
        {
            Image("Login")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minHeight: 300, maxHeight: 400)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack 
            {
                Image(systemName: "at")
                TextField("Email", text: $viewModelLogin.email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .focused($focus, equals: .email)
                    .submitLabel(.next)
                    .onSubmit {
                        self.focus = .password
                    }
            }
            .padding(.vertical, 6)
            .background(Divider(), alignment: .bottom)
            .padding(.bottom, 4)
            
            HStack 
            {
                Image(systemName: "lock")
                SecureField("Password", text: $viewModelLogin.password)
                    .focused($focus, equals: .password)
                    .submitLabel(.go)
                    .onSubmit {
                        signInWithEmailPassword()
                    }
            }
            .padding(.vertical, 6)
            .background(Divider(), alignment: .bottom)
            .padding(.bottom, 8)
        }
    }
    
    private func signInWithEmailPassword()
    {
        
    }
}


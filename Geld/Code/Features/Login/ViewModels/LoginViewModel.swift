//
//  LoginViewModel.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/02/24.
//

import Foundation

class LoginViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
}

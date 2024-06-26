//
//  SettingsScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/04/24.
//

import SwiftUI

struct SettingsScreen: View
{
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SettingsViewModel()
    @State var isShowSignUpDialogPresented = false

    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                Section
                {
                    NavigationLink(destination: UserProfileView()) 
                    {
                        Label("Account", systemImage: "person.circle")
                    }
                }
                Section
                {
                    if viewModel.isGuestUser
                    {
                        Button(action: signUp) 
                        {
                            HStack
                            {
                                Spacer()
                                Text("Sign up")
                                Spacer()
                            }
                        }
                    }
                    else
                    {
                        Button(action: signOut) 
                        {
                            HStack 
                            {
                                Spacer()
                                Text("Sign out")
                                Spacer()
                            }
                        }
                    }
                } footer: 
                {
                    HStack 
                    {
                        Spacer()
                        Text(viewModel.loggedInAs)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) 
                {
                    Button(action: { dismiss() }) 
                    {
                        Text("Done")
                    }
                }
            }
            .sheet(isPresented: $isShowSignUpDialogPresented) 
            {
                AuthenticationView()
            }
        }
    }

    // MARK: - Funcs
    private func signUp()
    {
        isShowSignUpDialogPresented.toggle()
    }

    private func signOut()
    {
        viewModel.signOut()
    }
}

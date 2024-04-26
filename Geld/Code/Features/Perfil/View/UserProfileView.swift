//
//  UserProfileView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/04/24.
//

import SwiftUI
import FirebaseAnalyticsSwift
import FirebaseAuth
import Combine
import Factory

struct UserProfileView: View
{
    @StateObject var viewModel = UserProfileViewModel()
    @Environment(\.dismiss) var dismiss
    @State var presentingConfirmationDialog = false

    // MARK: - Body
    var body: some View
    {
        PerfilHeaderView()

        Text(viewModel.displayName)
            .bold()
            .font(.title)

        Form
        {
            Section("Email") 
            {
                VStack(alignment: .leading)
                {
                    Text("Email")
                        .font(.caption)
                    Text(viewModel.email)
                }

                VStack(alignment: .leading) 
                {
                    Text("UID")
                        .font(.caption)
                    Text(viewModel.user?.uid ?? "(unknown)")
                }

                VStack(alignment: .leading) 
                {
                    Text("Provider")
                        .font(.caption)
                    Text(viewModel.provider)
                }

                VStack(alignment: .leading) 
                {
                    Text("Anonymous / Guest user")
                        .font(.caption)
                    Text(viewModel.isGuestUser ? "Yes" : "No")
                }

                VStack(alignment: .leading) 
                {
                    Text("Verified")
                        .font(.caption)
                    Text(viewModel.isVerified ? "Yes" : "No")
                }
            }

            Section 
            {
                Button(role: .cancel, action: signOut) 
                {
                    HStack 
                    {
                        Spacer()
                        Text("Sair")
                        Spacer()
                    }
                }
            }

            Section
            {
                Button(role: .destructive, action: { presentingConfirmationDialog.toggle() }) 
                {
                    HStack 
                    {
                        Spacer()
                        Text("Excluir conta")
                        Spacer()
                    }
                }
            }
        }
        .background(Color("cor6"))
        .scrollContentBackground(.hidden)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("Excluir a conta é permanente. Deseja mesmo excluir?",
                            isPresented: $presentingConfirmationDialog, titleVisibility: .visible)
        {
            Button("Excluir conta", role: .destructive, action: deleteAccount)
            Button("Cancelar", role: .cancel, action: { })
        }
    }

    // MARK: - Funcs
    private func deleteAccount()
    {
        Task
        {
            if await viewModel.deleteAccount() == true
            {
                dismiss()
            }
        }
    }

    private func signOut()
    {
        viewModel.signOut()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView()
        }
    }
}


#Preview {
    UserProfileView()
}

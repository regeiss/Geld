//
//  PerfilScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import SwiftUI

struct PerfilListaScreen: View 
{
    @StateObject private var viewModel = PerfilViewModel()
    @State private var isAddDialogPresented = false
    @State private var editablePerfil: Perfil?

    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            List($viewModel.perfis) { $perfil in
                PerfilDetalheView(perfil: $perfil)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true)
                {
                    Button(role: .destructive, action: { viewModel.delete(perfil)})
                    {
                        Image(systemName: "trash")
                    }
                }
                .onTapGesture
                {
                    editablePerfil = perfil
                }
            }
            .navigationTitle("Perfil")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button(action: presentAddView)
                    {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddDialogPresented)
            {
                PerfilAddEditView { perfil in
                    viewModel.addPerfil(perfil)
                }
            }
            .sheet(item: $editablePerfil) { perfil in
                PerfilAddEditView(perfil: perfil, mode: .edit) { perfil in
                    viewModel.update(perfil)
                }
            }
            .tint(.blue)
        }
    }
    // MARK: - Funcs
    private func presentAddView()
    {
        isAddDialogPresented.toggle()
    }
}


//#Preview {
//    PerfilScreen()
//}

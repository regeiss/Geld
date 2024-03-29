//
//  BancoListScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/03/24.
//

import SwiftUI

struct BancoListaScreen: View
{
    @StateObject private var viewModel = BancoViewModel()
    @State private var isAddDialogPresented = false
    @State private var editableBanco: Banco?
    
    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            List($viewModel.banco) { $banco in
                BancoDetalheView(banco: $banco)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true)
                {
                    Button(role: .destructive, action: { viewModel.delete(banco)})
                    {
                        Image(systemName: "trash")
                    }
                }
                .onTapGesture
                {
                    editableBanco = banco
                }
            }
            .navigationTitle("Banco")
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
                BancoAddEditView { banco in
                    viewModel.addBanco(banco)
                }
            }
            .sheet(item: $editableBanco) { banco in
                BancoAddEditView(banco: banco, mode: .edit) { banco in
                    viewModel.update(banco)
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

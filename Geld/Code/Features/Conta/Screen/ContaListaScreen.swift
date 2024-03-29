//
//  ContaListaScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 11/03/24.
//

import SwiftUI

struct ContaListaScreen: View
{
    @StateObject private var viewModel = ContaViewModel()
    @State private var isAddDialogPresented = false
    @State private var editableConta: Conta?
    
    private func presentAddView()
    {
        isAddDialogPresented.toggle()
    }
    
    var body: some View
    {
        NavigationStack
        {
        List($viewModel.contas) { $conta in
            ContaDetalheView(conta: $conta)
                .swipeActions(edge: .trailing, allowsFullSwipe: true)
            {
                Button(role: .destructive, action: { viewModel.delete(conta)})
                {
                    Image(systemName: "trash")
                }
            }
            .onTapGesture
            {
                editableConta = conta
            }
        }
        .navigationTitle("Conta")
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
            ContaAddEditView { conta in
                viewModel.addConta(conta)
            }
        }
        .sheet(item: $editableConta) { conta in
            ContaAddEditView(conta: conta, mode: .edit) { conta in
                viewModel.update(conta)
            }
        }
        .tint(.blue)
    }
    }
}

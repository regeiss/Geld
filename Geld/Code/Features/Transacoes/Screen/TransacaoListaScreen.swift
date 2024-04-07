//
//  TransacaoListaScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 30/03/24.
//

import SwiftUI

struct TransacaoListaScreen: View
{
    @StateObject private var viewModel = TransacaoViewModel()
    @State private var isAddDialogPresented = false
    @State private var editableTransacao: Transacao?

    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            List($viewModel.transacoes) { $transacao in
                TransacaoDetalheView(transacao: $transacao, isHome: false)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true)
                {
                    Button(role: .destructive, action: { viewModel.delete(transacao)})
                    {
                        Image(systemName: "trash")
                    }
                }
                .onTapGesture
                {
                    editableTransacao = transacao
                }
            }
            .navigationTitle("Transacao")
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
                TransacaoAddEditView { transacao in
                    viewModel.addTransacao(transacao)
                }
            }
            .sheet(item: $editableTransacao) { transacao in
                TransacaoAddEditView(transacao: transacao, mode: .edit) { transacao in
                    viewModel.update(transacao)
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

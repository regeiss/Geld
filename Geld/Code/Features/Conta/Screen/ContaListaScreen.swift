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
    @State private var editableConta: ContaModel?
    
    private func presentAddView()
    {
        isAddDialogPresented.toggle()
    }
    
    var body: some View
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
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar)
            {
                Button(action: presentAddView)
                {
                    HStack
                    {
                        Image(systemName: "plus.circle.fill")
                        Text("Nova conta")
                    }
                }
                Spacer()
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
        .tint(.red)
    }
}

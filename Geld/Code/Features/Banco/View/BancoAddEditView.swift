//
//  BancoAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/03/24.
//

import SwiftUI

struct BancoAddEditView: View
{
    enum FocusableField: Hashable
    {
        case nome
    }
    
    enum Mode
    {
        case add
        case edit
    }

    @FocusState private var focusedField: FocusableField?
    @State var banco = Banco(nome: "")
    @Environment(\.dismiss) private var dismiss
    
    var mode: Mode = .add
    let onCommit: (_ banco: Banco) -> Void
    
    private func commit()
    {
        onCommit(banco)
        dismiss()
    }
    
    private func cancel()
    {
        dismiss()
    }
    
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                TextField("Nome", text: $banco.nome)
                    .focused($focusedField, equals: .nome)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "Novo banco" : "Detalhes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
              ToolbarItem(placement: .cancellationAction) {
                Button(action: cancel) {
                  Text("Cancelar")
                }
              }
              ToolbarItem(placement: .confirmationAction) {
                Button(action: commit) {
                  Text(mode == .add ? "Add" : "Feito")
                }
                .disabled(banco.nome.isEmpty)
              }
            }
            .onAppear
            {
                focusedField = .nome
            }
        }
    }
}

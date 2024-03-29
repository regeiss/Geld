//
//  ContaAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 16/03/24.
//

import SwiftUI

struct ContaAddEditView: View
{
    // MARK: - Vars
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: FocusableField?
    @State var conta = Conta(nome: "")
    
    enum FocusableField: Hashable
    {
        case nome
    }
    
    enum Mode
    {
        case add
        case edit
    }
    
    var mode: Mode = .add
    let onCommit: (_ conta: Conta) -> Void
    
    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                TextField("Nome", text: $conta.nome)
                    .focused($focusedField, equals: .nome)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "Nova conta" : "Detalhes")
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
                    .disabled(conta.nome.isEmpty)
                }
            }
            .onAppear
            {
                focusedField = .nome
            }
        }
    }
    
    // MARK: - Funcs
    private func commit()
    {
        onCommit(conta)
        dismiss()
    }
    
    private func cancel()
    {
        dismiss()
    }
}

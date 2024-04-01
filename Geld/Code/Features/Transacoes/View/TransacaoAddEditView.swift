//
//  TransacaoAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 30/03/24.
//

import SwiftUI

struct TransacaoAddEditView: View 
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
    @State var transacao = Transacao(icone: "", iconeCor: 0, nome: "", data: Date(), valor: 0)
    @Environment(\.dismiss) private var dismiss

    var mode: Mode = .add
    let onCommit: (_ transacao: Transacao) -> Void

    private func commit()
    {
        onCommit(transacao)
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
                TextField("Nome", text: $transacao.nome)
                    .focused($focusedField, equals: .nome)
                TextField("icone", text: $transacao.icone)

                TextField("Cor icone", value: ($transacao.iconeCor), format: .number)
                TextField("Data", value: $transacao.data, format: .dateTime)
                TextField("Valor", value: $transacao.valor, format: .number)

            }.onSubmit {commit() }
            .navigationTitle(mode == .add ? "Novo transacao" : "Detalhes")
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
                    .disabled(transacao.nome.isEmpty)
                }
            }
            .onAppear
            {
                focusedField = .nome
            }
        }
    }
}

//#Preview {
//    TransacaoAddEditView()
//}

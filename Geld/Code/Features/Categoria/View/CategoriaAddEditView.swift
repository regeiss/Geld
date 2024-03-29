//
//  CategoriaAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 27/03/24.
//

import SwiftUI

struct CategoriaAddEditView: View 
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
    @State var categoria = Categoria(nome: "")
    @Environment(\.dismiss) private var dismiss

    var mode: Mode = .add
    let onCommit: (_ categoria: Categoria) -> Void

    private func commit()
    {
        onCommit(categoria)
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
                TextField("Nome", text: $categoria.nome)
                    .focused($focusedField, equals: .nome)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "Novo categoria" : "Detalhes")
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
                .disabled(categoria.nome.isEmpty)
              }
            }
            .onAppear
            {
                focusedField = .nome
            }
        }
    }
}

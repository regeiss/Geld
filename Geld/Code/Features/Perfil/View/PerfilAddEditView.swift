//
//  PerfilAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 30/03/24.
//

import SwiftUI

struct PerfilAddEditView: View
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
    @State var perfil = Perfil(nome: "")
    @Environment(\.dismiss) private var dismiss

    var mode: Mode = .add
    let onCommit: (_ perfil: Perfil) -> Void

    private func commit()
    {
        onCommit(perfil)
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
            VStack {
                        VStack {
                            Header()
                            ProfileText()
                        }
                        Spacer()
                    }

            .navigationTitle(mode == .add ? "Novo perfil" : "Detalhes")
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
                    .disabled(perfil.nome.isEmpty)
                }
            }
            .onAppear
            {
                focusedField = .nome
            }
        }
    }
}

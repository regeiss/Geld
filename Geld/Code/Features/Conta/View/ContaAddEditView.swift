//
//  ContaAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 16/03/24.
//

import SwiftUI

struct ContaAddEditView: View
{
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: FocusableField?
    @State var conta = ContaModel(nome: "")
    
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
    let onCommit: (_ conta: ContaModel) -> Void
    
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
              .navigationTitle(mode == .add ? "New Reminder" : "Details")
              .navigationBarTitleDisplayMode(.inline)
              .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                  Button(action: cancel) {
                    Text("Cancel")
                  }
                }
                ToolbarItem(placement: .confirmationAction) {
                  Button(action: commit) {
                    Text(mode == .add ? "Add" : "Done")
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
    
    // MARK: - Functions
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

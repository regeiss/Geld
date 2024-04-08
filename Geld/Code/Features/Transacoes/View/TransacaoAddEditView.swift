//
//  TransacaoAddEditView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 30/03/24.
//

import SwiftUI
import SFSymbolsPicker

struct TransacaoAddEditView: View
{
    // MARK: - Enums
    enum FocusableField: Hashable
    {
        case nome
    }

    enum Mode
    {
        case add
        case edit
    }

    // MARK: - Vars
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: FocusableField?
    @State var transacao = Transacao(icone: "", iconeCor: "", nome: "", data: Date(), valor: 0)
    @State var iconColor = Color("aqua")
    @State private var icon = "star.fill"
    @State private var isPresented = false

    var hex: String = ""
    var color: Color = .gray
    var mode: Mode = .add
    let onCommit: (_ transacao: Transacao) -> Void

    // MARK: - Body
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                TextField("Nome", text: $transacao.nome)
                    .focused($focusedField, equals: .nome)

                VStack
                {
                    ColorPicker("Cor do icone", selection: $iconColor, supportsOpacity: false)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack
                {
                    Button("Selecione um ícone")
                    {
                        isPresented.toggle()
                    }

                    Image(systemName: icon).font(.title3)

                        .sheet(isPresented: $isPresented, content: {
                            SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)
                        }).padding()
                }

                DatePicker("Data", selection: $transacao.data)
                    .frame(maxHeight: 400)
                    .environment(\.locale, Locale.init(identifier: "pt-BR"))

                TextField("Valor", value: $transacao.valor, format: .number)

            }.onSubmit {commit() }
                .navigationTitle(mode == .add ? "Nova transação" : "Detalhes")
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
                icon = transacao.icone
                iconColor = Color(hex: transacao.iconeCor) ?? .gray
                focusedField = .nome
            }
        }
    }

    // MARK: - Funcs
    private func commit()
    {
        transacao.icone = icon
        transacao.iconeCor = iconColor.toHex() ?? ""
        onCommit(transacao)
        dismiss()
    }

    private func cancel()
    {
        dismiss()
    }
}

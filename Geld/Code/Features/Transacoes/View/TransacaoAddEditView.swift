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
    @State var transacao = Transacao(icone: "", iconeCor: "", nome: "", data: Date(), valor: 0)
    @State var iconColor = Color("aqua")

    @Environment(\.dismiss) private var dismiss

    var mode: Mode = .add
    let onCommit: (_ transacao: Transacao) -> Void

    var body: some View
    {
        NavigationStack
        {
            Form
            {
                TextField("Nome", text: $transacao.nome)
                    .focused($focusedField, equals: .nome)
                TextField("icone", text: $transacao.icone)

                VStack 
                {
                    ColorPicker("Cor do icone", selection: $iconColor, supportsOpacity: false)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

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
                focusedField = .nome
            }
        }
    }

    private func commit()
    {
        transacao.iconeCor = hexStringFromColor(color: Color(uiColor: .iconColor)
        onCommit(transacao)
        dismiss()
    }

    private func cancel()
    {
        dismiss()
    }

    func hexStringFromColor(color: UIColor) -> String {
        let components = color.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        print(hexString)
        return hexString
     }
}

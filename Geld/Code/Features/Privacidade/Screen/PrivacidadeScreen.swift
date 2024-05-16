//
//  PrivacidadeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 07/05/24.
//

import SwiftUI

struct PrivacidadeScreen: View
{
    @Environment(\.dismiss) var dismiss
    let parentDismiss: DismissAction

    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                Text("Privacidade")
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Fechar") {
                        dismiss() }
                }
            }
        }.onDisappear { parentDismiss()}
    }
}

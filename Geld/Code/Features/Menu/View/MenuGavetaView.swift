//
//  MenuGavetaView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/04/24.
//

import SwiftUI

enum ItemGaveta
{
    case privacidade
    case notificaoes
}

struct MenuGavetaView: View
{
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State var item: ItemGaveta = .privacidade

    var body: some View
    {
        VStack
        {
            HStack
            {
                VStack
                {
                    Button(action: { acaoBotao(item: .notificaoes)}) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Categorias")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                Spacer()

                VStack
                {
                    Button(action: { acaoBotao(item: .notificaoes)}) { Image(systemName: "gear")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Ajustes")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                Spacer()

                VStack
                {
                    Button(action: { acaoBotao(item: .privacidade)}) { Image(systemName: "shield")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Privacidade")
                        .bold().frame(maxWidth: .infinity)
                }
            }.padding([.leading, .trailing], 35)

            HStack
            {
                VStack
                {
                    Button(action: { acaoBotao(item: .notificaoes)}) { Image(systemName: "bell.and.waves.left.and.right.fill")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Notificações")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                Spacer()

                VStack
                {
                    Button(action: { showingSheet = true
                        item = .notificaoes
                         }) { Image(systemName: "building.columns.fill")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Bancos")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                Spacer()

                VStack
                {
                    Button(action: { showingSheet = true
                        item = .privacidade }) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
            }.padding([.top, .leading, .trailing], 35)
        }
        .fullScreenCover(isPresented: $showingSheet)
        {
            switch item
            {
            case .notificaoes:
                NotificacoesScreen()
            case .privacidade:
                PrivacidadeScreen(parentDismiss: dismiss)
            }
        }
    }

    func acaoBotao(item: ItemGaveta)
    {

    }
}

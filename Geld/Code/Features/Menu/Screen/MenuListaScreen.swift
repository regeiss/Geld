//
//  MenuListaScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 08/04/24.
//

import SwiftUI

struct MenuListaScreen: View
{
    var body: some View
    {
        let colecaoMenu = [
            MenuColecao(id: 0, name: "Categoria", image: "gasStation", menu: .categoria),
            MenuColecao(id: 1, name: "Serviço", image: "service", menu: .servico),
            MenuColecao(id: 2, name: "Transferencias", image: "report", menu: .transferencias),
            MenuColecao(id: 3, name: "Alertas", image: "alertas", menu: .alerta),
            MenuColecao(id: 4, name: "Cadastros", image: "config", menu: .cadastro),
            MenuColecao(id: 5, name: "Dashboard", image: "config", menu: .dashboard)
        ]

        NavigationStack
        {
            ZStack
            {
                let columns = [ GridItem(.flexible(minimum: 230, maximum: .infinity))]

                VStack(alignment: .leading)
                {
                    ScrollView(.vertical)
                    {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 5)
                        {
                            ForEach(colecaoMenu) { item in
                                MenuPrincipalItemView(colecao: item)
                                //                                            .onTapGesture {
                                //                                                viewModel.didTapBuiltIn(id: item.id)
                                //                                            }
                            }.padding([.leading, .trailing])

                        }
                        .padding()
                    }
                }.background(Color("backGroundColor"))

            }.navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

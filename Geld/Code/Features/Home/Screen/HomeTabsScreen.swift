//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI

enum Tabs: String
{
    case home
    case conta
    case transferencia
    case deposit
    case perfil
}

struct HomeTabsScreen: View
{
    @State var selectedTab: Tabs = .home

    init()
    {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
    }

    var body: some View
    {
        VStack
        {
            TabView(selection: $selectedTab)
            {
                HomeScreen()
                    .tabItem { Label("Home", systemImage: "house")}
                    .tag(Tabs.home)

                TransacaoListaScreen()
                    .tabItem { Label("Transacoes", systemImage: "arrow.left.arrow.right")}
                    .tag(Tabs.conta)

                ContaListaScreen()
                    .tabItem { Label("Cartões", systemImage: "creditcard")}
                    .tag(Tabs.conta)
                
                CategoriaListaScreen()
                    .tabItem { Label("Categorias", systemImage: "list.bullet.clipboard")}
                    .tag(Tabs.conta)

                PerfilListaScreen()
                    .tabItem { Label("Perfis", systemImage: "person")}
                    .tag(Tabs.perfil)

            }
        }
    }
}

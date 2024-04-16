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
    case transacao
    case perfil
    case menu
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
                    .tag(Tabs.transacao)

                ContaListaScreen()
                    .tabItem { Label("Cartões", systemImage: "creditcard")}
                    .tag(Tabs.conta)

                MenuListaScreen()
                    .tabItem { Label("Menus", systemImage: "list.bullet.clipboard")}
                    .tag(Tabs.menu)

                PerfilListaScreen()
                    .tabItem { Label("Perfis", systemImage: "person")}
                    .tag(Tabs.perfil)
            }
        }
    }
}

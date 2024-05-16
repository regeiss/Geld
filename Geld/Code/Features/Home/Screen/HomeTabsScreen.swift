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

@available(iOS 17.0, *)
struct HomeTabsScreen: View
{
    @State var selectedTab: Tabs = .home
    @State var previousTab: Tabs = .home
    @State private var isSheetVisible = false

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

                PerfilListaScreen()
                    .tabItem { Label("Perfis", systemImage: "person")}
                    .tag(Tabs.perfil)

                Image(systemName: "ellipsis")
                    .tabItem { Label("Mais", systemImage: "ellipsis")}
                    .tag(Tabs.menu)
                    .sheet(isPresented: $isSheetVisible, onDismiss: didDismiss)
                {
                    MenuGavetaView()
                        .presentationDetents([.fraction(0.3)])
                        .presentationDragIndicator(.visible)
                }
            }
            .onChange(of: selectedTab) { oldValue, newValue in
                if newValue == .menu {
                    isSheetVisible = true
                    selectedTab = oldValue
                }
            }
        }
    }

    func didDismiss()
    {

    }
}

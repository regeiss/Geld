//
//  HomeScreen.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 04/03/24.
//

import SwiftUI
import SwiftUICoordinator

struct HomeScreen<Coordinator: Routing>: View
{
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = ViewModel<Coordinator>()
    
    var body: some View
    {
        TabView
        {
            Text("Tab 1")
                .tabItem {
                    Label("Tab 1",
                          systemImage: "building.columns")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Tab 2",
                          systemImage: "chart.bar.xaxis.ascending")
                }
            
            Text("Tab 1")
                .tabItem {
                    Label("Tab 1",
                          systemImage: "briefcase")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Tab 2",
                          systemImage: "person.fill")
                }
        }.onAppear { viewModel.coordinator = coordinator }
    }
}

extension HomeScreen
{
    @MainActor class ViewModel<R: Routing>: ObservableObject
    {
        var coordinator: R?
        
        func didTapAdd()
        {
            coordinator?.handle(HomeAction.dashboard)
        }
    }
}

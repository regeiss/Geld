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
    
    @StateObject var tabBarController = TabBarController()
    
    var body: some View
    {
        ZStack
        {
            Group
            {
                if tabBarController.selectedTab == .mainView
                {
                    Text("main")
                }
                
                if tabBarController.selectedTab == .secondView 
                {
                    Text("Second")
                }
            }.padding(.bottom, 50)
            TabBarView()
        }
        .onAppear { viewModel.coordinator = coordinator }
        .environmentObject(tabBarController)
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

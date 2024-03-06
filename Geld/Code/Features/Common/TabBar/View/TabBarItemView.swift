//
//  TabBarItemView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 05/03/24.
//

import SwiftUI

struct TabBarItemView: View
{
    @EnvironmentObject var tabBarController: TabBarController
    
    var contentTab: ContentTab
    
    var body: some View 
    {
        Button(action: {
            tabBarController.selectedTab = contentTab
        }) {
            HStack {
                Image(systemName: contentTab.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(tabBarController.selectedTab == contentTab ? .blue : .cyan)
        }
    }
}

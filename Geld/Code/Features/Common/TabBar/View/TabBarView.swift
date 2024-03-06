//
//  TabBarView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 05/03/24.
//

import SwiftUI

struct TabBarView: View 
{
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                HStack(spacing: 0) {
                    TabBarItemView(contentTab: .mainView)
                    TabBarItemView(contentTab: .secondView)
                }
                // TabBarHeroItem
            }
        }
    }
}

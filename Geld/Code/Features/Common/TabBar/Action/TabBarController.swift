//
//  TabBarController.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 05/03/24.
//

import Foundation

enum ContentTab
{
    case mainView
    case secondView
    
    var imageName: String
    {
        switch self
        {
        case .mainView: "house"
        case .secondView: "person"
        }
    }
}

class TabBarController: ObservableObject
{
    @Published var selectedTab: ContentTab = .mainView
    @Published var isShowingHeroView: Bool = false
}


//
//  AppTheme.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 19/03/24.
//

import Foundation
import SwiftUI

class AppThemeViewModel: ObservableObject
{
    @AppStorage("modoEscuro") var isDarkMode: Bool = true
}

struct DarkModeViewModifier: ViewModifier
{
    @ObservedObject var appThemeViewModel: AppThemeViewModel = AppThemeViewModel()
    
    public func body(content: Content) -> some View
    {
        content
            .preferredColorScheme(appThemeViewModel.isDarkMode ? .dark : appThemeViewModel.isDarkMode == false ? .light : nil)
    }
}

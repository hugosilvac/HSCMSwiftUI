//
//  Coordinator.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var selectTab: TabIcon = .Discover
    
    //Armazena as instâncias da view
    private(set) var contentView = ContentView()
    
    func selectBar(_ tab: TabIcon) {
        selectTab = tab
    }
    
    func currentView() -> some View {
        switch selectTab {
        case .Discover:
            return contentView
        case .Characters:
            return contentView
        case .Favorite:
            return contentView
        }
    }
}

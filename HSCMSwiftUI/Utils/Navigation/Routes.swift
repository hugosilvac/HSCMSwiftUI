//
//  Routes.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import SwiftUI

struct Routes: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        coordinator.currentView()
        Spacer()
        TabBarView.init(selectedTab: $coordinator.selectTab)
    }
}

#Preview {
    Routes()
}

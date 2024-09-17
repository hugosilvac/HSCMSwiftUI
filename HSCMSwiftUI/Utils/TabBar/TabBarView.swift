//
//  TabBarView.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import SwiftUI

struct TabBar: Identifiable{
    var id = UUID()
    var iconName: String
    var tab: TabIcon
}

enum TabIcon{
    case Discover
    case Characters
    case Favorite
}

let tabItens = [
    TabBar(iconName: "house", tab: .Discover),
    TabBar(iconName: "person.crop.rectangle.stack", tab: .Characters),
    TabBar(iconName: "heart", tab: .Favorite)
]


struct TabBarView: View {
    
    @Binding var selectedTab: TabIcon
    
    var body: some View {
        HStack {
            ForEach(tabItens) { iten in
                Button(action: {
                    selectedTab = iten.tab
                }, label: {
                    Spacer()
                    TabBarItem(icon: iten.iconName, isSelected: iten.tab == selectedTab)
                    Spacer()
                })
            }
        }
        .frame(height: 70)
        .padding(.bottom, 24)
        .padding(.top, 8)
        .background(Color("TabBarColor"))
    }
}

struct TabBarItem: View {
    
    var icon: String
    var isSelected: Bool
    
    var body: some View {
        ZStack{
            if isSelected {
                Circle()
                    .fill(Color("mRed"))
                    .frame(width: 50, height: 50)
            }
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .regular))
            
        }
    }
}

#Preview {
    Routes()
}

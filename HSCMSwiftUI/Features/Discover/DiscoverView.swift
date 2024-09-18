//
//  DiscoverView.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject private var discoverViewModel = DiscoverViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("hollywoodLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 230, height: 62)
                    .foregroundColor(.white)
                Spacer()
                ScrollView(.vertical,
                           showsIndicators: false) {
                    VStack{
                        if discoverViewModel.results.isEmpty {
                            Text("Is EMpty")
                        } else {
                            CarouselDiscover(Title: "Discover",
                                             listMovieModel: discoverViewModel.results)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.white))
    }
}

#Preview {
    DiscoverView()
}

//
//  DiscoverViewModel.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import Foundation

class DiscoverViewModel: ObservableObject{
    
    @Published var results: [MovieModel]
    
    init(){
        results = []
        fetchResponseDiscover()
    }
    
    func fetchResponseDiscover(){
        
        ApiService.singleton.getDiscover { infoRequest in
            DispatchQueue.main.async {
                self.results = infoRequest.results
            }
        }
        
    }
}

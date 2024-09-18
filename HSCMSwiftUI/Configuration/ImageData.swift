//
//  URLImage.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 18/09/24.
//

import Foundation

class ImageData: ObservableObject{

    @Published var data: Data = Data()
    
    init(imageURL: URL) {
        URLSession.shared.dataTask(with: imageURL) { data, respose, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

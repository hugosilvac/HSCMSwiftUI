//
//  CarouselImage.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 18/09/24.
//

import SwiftUI

struct CarouselImage: View {
    
    @ObservedObject var imageData: ImageData
    
    init(imageURL: URL){
        imageData = ImageData(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: imageData.data) ?? UIImage())
            .resizable()
            .scaledToFill()
//            .frame(width: 340)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .shadow(color: .gray, radius: 10)
        
    }
}

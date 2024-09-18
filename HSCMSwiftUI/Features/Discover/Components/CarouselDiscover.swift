//
//  CarouselDiscover.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 18/09/24.
//

import Foundation
import SwiftUI

struct CarouselDiscover: View{
    
    var Title: String
    var listMovieModel: [MovieModel]
        
    var body: some View{
        VStack(alignment: .leading){
            
            Text(Title)
                .font(.custom("BentonSans Comp Black", size: 28))
                .padding(.top, 8)
                .foregroundColor(.black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0, content: {
                    ForEach(1..<listMovieModel.count, id: \.self) { index in
                        
                        HStack{
                            ZStack {
                                if let url = URL(string: ManagerImage.linkImage(size: .W780, finalURL: listMovieModel[index].backdropPath)){
                                    CarouselImage(imageURL: url)
                                }
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.6)]),
                                                   startPoint: .top,
                                                   endPoint: .bottom)
                                    HStack{
                                        Text("\(listMovieModel[index].title)")
                                            .font(.custom("BentonSans Comp Black", size: 22))
                                            .padding(.top, 160)
                                            .padding(.bottom, 8)
                                            .padding(.leading, 16)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                            }
                        }.containerRelativeFrame(.horizontal)
                    }
                })
            }
            .scrollTargetBehavior(.paging)
            .frame(height: 210)
        }
        .padding()
        .background(.white)
    }
}

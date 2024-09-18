//
//  ManagerImage.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 18/09/24.
//

enum ImageSize: String {
    case W92 = "w92"
    case W154 = "w154"
    case W185 = "w185"
    case W342 = "w342"
    case W500 = "w500"
    case W780 = "w780"
    case Original = "original"
}

struct ManagerImage{
    
    static func linkImage(size: ImageSize, finalURL: String) -> String{
        return Constants.Config.ImageURL + size.rawValue + finalURL
    }
    
}

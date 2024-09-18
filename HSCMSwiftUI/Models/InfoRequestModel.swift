//
//  InfoRequestModel.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import Foundation

struct InfoRequestModel: Codable{

    var page: Int
    var totalResults: Int
    var totalPages: Int 
    var results: [MovieModel]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.results = try container.decode([MovieModel].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey{
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}


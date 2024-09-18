//
//  ApiService.swift
//  HSCMSwiftUI
//
//  Created by Hugo Cantanhede on 17/09/24.
//

import Foundation

class ApiService {
    
    static var singleton = ApiService()
    
    func getNowPlaying(completion: @escaping (_ infoRequest: InfoRequestModel) -> Void) {

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjRjZWY0Yzg2OTViZTkyZmU5YmU3ODJmMjA2NWU0MiIsIm5iZiI6MTcyNjU5ODc2MC41MjgxNTUsInN1YiI6IjVjOTQyZWFmMGUwYTI2NDVlZTRlZjUxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wAXJhOLkuQieRmHOl4681TwvQQsIbT6cVn0ieGG1LAQ"
        ]

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
           //     completion()
                return
            }
            
            print(String(decoding: data, as: UTF8.self))
            
            do {
                let response = try JSONDecoder().decode(InfoRequestModel.self, from: data)
                completion(response)
                print(String(decoding: data, as: UTF8.self))
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
          //      completion()
            }
        }.resume()
    }
    
    func getDiscover(completion: @escaping (_ infoRequest: InfoRequestModel) -> Void) {

        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "include_adult", value: "false"),
          URLQueryItem(name: "include_video", value: "false"),
          URLQueryItem(name: "language", value: "pt"),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "sort_by", value: "popularity.desc"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjRjZWY0Yzg2OTViZTkyZmU5YmU3ODJmMjA2NWU0MiIsIm5iZiI6MTcyNjU5ODc2MC41MjgxNTUsInN1YiI6IjVjOTQyZWFmMGUwYTI2NDVlZTRlZjUxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wAXJhOLkuQieRmHOl4681TwvQQsIbT6cVn0ieGG1LAQ"
        ]

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
           //     completion()
                return
            }
            
            print(String(decoding: data, as: UTF8.self))
            
            do {
                let response = try JSONDecoder().decode(InfoRequestModel.self, from: data)
                completion(response)
                print(String(decoding: data, as: UTF8.self))
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
          //      completion()
            }
        }.resume()
    }
}

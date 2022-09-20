//
//  NetworkProvider.swift
//  PMx
//
//  Created by home on 12/04/22.
//

import Foundation

final class NetworkProvider{
    
    static let shared = NetworkProvider()
    
    private let estrenosUrl = "https://ramonfe.github.io/film/indexEstrenos.html"
    private let proxEstrenosUrl = "https://ramonfe.github.io/film/indexProxEstrenos.html"
    private let streamUrl = "https://ramonfe.github.io/film/indexStream.html"
    
    func loadEstrenos() async -> [Peliculas]{
        guard let url = URL(string: estrenosUrl) else {return []}
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decoded =  try? JSONDecoder().decode([Peliculas].self, from: data){
                return decoded
            }
        }catch{
            print(error.localizedDescription)
        }
      return []
    }
}

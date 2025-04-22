//
//  Website.swift
//  Final Project S-25
//
//  Created by Ocean Chen on 4/8/25.
//
import Foundation

class Navigating{
    
    static func getcard()async throws -> [Datum] {
        let url = URL(string: "https://api.pokemontcg.io/v2/cards")
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let cards = try JSONDecoder().decode(PurpleData.self, from: data)
            return cards.data
        }catch {print("Error: \(error)")
            throw error
        }
    }
}


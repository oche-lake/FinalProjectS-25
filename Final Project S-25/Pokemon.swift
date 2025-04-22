//
//  Pokemon.swift
//  Final Project S-25
//
//  Created by Ocean Chen on 4/15/25.
//
import SwiftUI

struct Pokemon: View {
    @State private var cards: [Datum] = []
    private var alphabetical: [Datum] {
           cards.sorted { $0.name < $1.name }
       }
    var body: some View {
        NavigationStack{
            if cards.isEmpty {
                Text("Loading...")
            }
            List(alphabetical, id: \.id) { card in
                NavigationLink{
                    Pokemontype(card: card)
                }label:{
                    HStack {
                        Text("\(card.name) (\(card.datumSet.series))")
                        Spacer()
                        Text(card.types.map { $0.rawValue }.joined(separator: ", "))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Pokemons")
            }
            .onAppear {
                Task {
                    cards = try await Navigating.getcard()
                }
            }
        }
    }
}
struct Pokemontype: View {
    var card: Datum
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.images.large)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            if let avgPrice = card.cardmarket?.prices["averageSellPrice"] {
                Text(String(format: "Avg Price: $%.2f", avgPrice))
                    .font(.headline)
            } else {
                Text("Price: N/A")}
            Text("Types: \(card.types.map { $0.rawValue }.joined(separator: ", "))")
                .font(.headline)
                .padding()
            Text("Evolee From: \(card.evolvesFrom ?? "None")")
            Text("Evolves To: \(card.evolvesTo?.joined(separator: ", ") ?? "None")")
            AsyncImage(url:URL(string:card.datumSet.images.logo)){image in
                image.resizable()
                    .frame(width: 300, height: 100)
                    .scaledToFit()
            }placeholder:{
                ProgressView()
            }
        }
        .padding()
        .navigationTitle(card.name)
    }
}

#Preview{
    Pokemon()
}

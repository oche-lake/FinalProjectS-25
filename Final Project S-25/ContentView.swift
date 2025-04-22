//
//  ContentView.swift
//  Final Project S-25
//
//  Created by Ocean Chen on 4/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var user: Playerinfo = .example
    @State private var isDarkMode: Bool = false
    var body: some View {
        NavigationStack{
            ZStack {
                isDarkMode ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink{
                            PlayerID(user: $user)
                        }label: {
                            Text("Edit")
                                .padding(.horizontal)
                        }
                    }
                    Section{
                        IDCard(user: $user)
                            .mask(
                                RoundedRectangle(cornerRadius: 12)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.primary.opacity(0.4), lineWidth: 2)
                            )
                            .padding(.horizontal , 8)
                            .shadow(radius: 5)
                    }
//                    .frame(height: 290)
                    Spacer()
                    NavigationLink(destination: Pokemon()){
                        Text("View Pokemon List")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                            .background(LinearGradient(
                                colors: isDarkMode ? [.purple, .blue] :[.red, .yellow.opacity(0.6)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .cornerRadius(10)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary, lineWidth: 2))
                    }
                    Spacer()
                    Image(isDarkMode ? "snorlax" : "Snorlax-Pokemon-PNG-Photos")
                        .resizable()
                        .frame(width: 300, height: 220)
                        .padding()
                
                }
                .navigationTitle("Welcome Trainer")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isDarkMode.toggle()
                        })
                        {
                            Image(systemName: isDarkMode ?   "moon.fill":"sun.max.fill")
                                .foregroundColor(isDarkMode ? .teal : .yellow)
                        }
                    }
                }
            }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
#Preview {
    ContentView()
}

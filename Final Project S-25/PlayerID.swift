//
//  PlayerID.swift
//  Final Project S-25
//
//  Created by Ocean Chen on 4/20/25.
//

import SwiftUI
struct PlayerID: View{
    @Binding var user: Playerinfo
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack{
                IDCard(user: $user)
                    .frame(height: 300)
                    .shadow(radius: 5)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Describe(user: $user)
                    .padding()
                    .background(VStack(spacing: 8) {
                        Color.red
                        Color.white
                    }
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 12)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.yellow.opacity(0.7), lineWidth: 5)
                    )
                    .padding(.horizontal)
                    .frame(height: 200)
                
                if user.gender == .male{
                    HStack{
                        Image("tree")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 100)
                            .padding(.top, 80)
                        //                        .background(Color.yellow)
                        Image("Sword_Male")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 240)
                        //                                        .background(.red)
                    }
                }
                else if user.gender == .female{
                    HStack(spacing: 0){
                        
                        Image("Sword_Female copy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125, height: 240)
                        //                                        .background(.blue)
                        Image("eevee")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 90)
                            .padding(.top, 120)
                        //                        .background(.yellow)
                    }
                }
                else if user.gender == .preferNotToSay{
                    Image("pokemon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 240)
                    //                    .background(.blue)
                }
                else{
                    HStack{
                        Image("female")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 240)
                        //                        .background(.blue)
                        Image("male")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 240)
                        //                        .background(.red)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
#Preview{
    PlayerID(user : .constant(Playerinfo.example))
}

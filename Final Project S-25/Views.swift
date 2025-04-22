//
//  Views.swift
//  Final Project S-25
//
//  Created by Ocean Chen on 4/21/25.
//

import SwiftUI
enum Gender: String, CaseIterable, Codable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
    case preferNotToSay = "Prefer not to say"
    case null = "--"
}

struct Playerinfo{
    var username: String
    var id = Int.random(in: 10_000_000...99_999_999)
    var selectedtype : RetreatCost
    var gender : Gender
    var height: Float
    var favorite : String
    var description: String
}
extension Playerinfo {
    static let example = Playerinfo(username: "Trainer",selectedtype: .null, gender: .null, height: 0.8, favorite:"", description: "" )
}


struct Describe: View{
    @Binding var user: Playerinfo
    var body: some View{
        Form{
            ZStack{
                TextField("Desctription of Yourself", text:$user.description, axis: .vertical)
                    .padding(4)
                    .lineLimit(3...8)
            }
        }
    }
}

struct IDCard: View{
    @Binding var user: Playerinfo
    var body: some View{
        Form{
            HStack{
                Text("Name: ")
                TextField("Enter your username", text: $user.username)
                    .multilineTextAlignment(.trailing)
            }
            HStack{
                Text("Trainer ID: ")
                Spacer()
                Text(String(format: "%08d", user.id))
                    .multilineTextAlignment(.trailing)
            }
            HStack{
                Picker("Gender:", selection: $user.gender) {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        Text(gender.rawValue)
                    }
                }
            }
            HStack{
                Text("Height(m): ")
                TextField("Your height in meters",  value: $user.height, format: .number)
                    .multilineTextAlignment(.trailing)
            }
            Picker("Favorite type:", selection: $user.selectedtype){
                ForEach(RetreatCost.allCases, id: \.self){type in
                    Text(type.rawValue)
                }
            }
            HStack{
                Text("Favorite Pokemon: ")
                TextField("Pokemon", text: $user.favorite)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

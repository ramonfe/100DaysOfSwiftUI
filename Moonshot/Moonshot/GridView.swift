//
//  GridView.swift
//  Moonshot
//
//  Created by Ramon Felix on 11/07/22.
//

import SwiftUI

struct GridView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(missions){mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    } label:{
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                .accessibilityHidden(true)
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .accessibilityElement()
                            .accessibilityLabel("Mission: \(mission.displayName), Launch date: \(mission.formattedLaunchDate)")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        GridView(astronauts: astronauts, missions: missions)
    }
}

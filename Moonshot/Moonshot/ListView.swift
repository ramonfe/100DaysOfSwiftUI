//
//  ListView.swift
//  Moonshot
//
//  Created by Ramon Felix on 11/07/22.
//

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List{
            ForEach(missions){mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                } label:{
                    HStack{
                        //VStack(alignment: .leading){
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                        //}
                        Spacer()
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                                //.foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                //.foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        //.background(.lightBackground)
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        
    }
}

struct ListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListView(astronauts: astronauts, missions: missions)
    }
}

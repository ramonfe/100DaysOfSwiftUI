//
//  MissionView.swift
//  Moonshot
//
//  Created by Ramon Felix on 10/07/22.
//

import SwiftUI

struct CrewMember{
    let role: String
    let astronaut: Astronaut
}

struct MyRectangle:View{
    var body: some View{
        Rectangle()
            .frame(height:2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct MissionView: View{
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View{
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityHidden(true)
                    HStack{
                        Text("Launch Date:")    
                        Text(mission.formattedLaunchDate)
                    }
                    .accessibilityHidden(true)
                    VStack(alignment: .leading){
                        MyRectangle()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        Text(mission.description)
                        
                        MyRectangle()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom,5)
                    }
                    .accessibilityElement()
                    .accessibilityValue("Mission Highlights")
                    .accessibilityHint(mission.description)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider{
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View{
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

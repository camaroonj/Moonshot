//
//  MissionView.swift
//  Moonshot
//
//  Created by Cameron Prestwich on 4/10/25.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    Text("\(mission.formattedLaunchDate)")
                        .font(.title)
                        .padding(.bottom, 10)
                }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                
                VStack(alignment: .leading) {
                    Text("\(mission.displayName) Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 10)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 10)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            guard let astronaut = astronauts[member.name] else {
                fatalError("Missing \(member.name)")
            }
            return CrewMember(role: member.role, astronaut: astronaut)
            }
        }
    }


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    

    return MissionView(mission: missions[10], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

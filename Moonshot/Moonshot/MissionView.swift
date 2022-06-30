//
//  MissionView.swift
//  Moonshot
//
//  Created by Dmitry Sokoltsov on 30.06.2022.
//

import SwiftUI


struct MissionView: View {
    
    let missions: Missions
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(missions.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 0.6)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Info")
                            .font(.title.bold())
                            .padding(.bottom, 6)
                        Text(missions.description)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(missions.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(missions: missions[0])
            .preferredColorScheme(.dark)
    }
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Dmitry Sokoltsov on 24.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Missions] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text("\(missions.count)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

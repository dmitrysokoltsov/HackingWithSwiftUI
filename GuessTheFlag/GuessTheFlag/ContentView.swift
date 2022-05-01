//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitry Sokoltsov on 30.04.2022.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Spain","US","UK"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Image("background")
                .blur(radius: 20)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Select the correct flag")
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.primary.opacity(0.8))
                        .padding()
                        .frame(height: 50)
                        .background(.ultraThinMaterial)
                        .cornerRadius(14)
                    
                }
                ForEach(0..<3) { number in
                    Button(){
                        //taped button
                    }label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .cornerRadius(14)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

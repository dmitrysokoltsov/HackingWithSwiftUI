//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitry Sokoltsov on 30.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Spain","US","UK"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    // Flag modifier 24 day
    struct FlagImage: View {
        var image: String
        var body: some View {
            Image(image)
            .renderingMode(.original)
            .cornerRadius(14)
            .shadow(radius: 5)
        }
        
    }
    var body: some View {
        ZStack {
            Image("background")
                .blur(radius: 20)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                
                
                VStack {
                    Text("Select the correct flag")
                        .modifier(CustomTitleModifier())
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(14)
                    
                }
                
                ForEach(0..<3) { number in
                    Button(){
                        flagTapped(number)
                    }label: {
                        FlagImage(image: countries[number])
                    }
                }
                HStack() {
                    Text("Score: \(score)")
                        .modifier(CustomTitleModifier())
                }
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong its \(countries[number])"
            score = 0
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

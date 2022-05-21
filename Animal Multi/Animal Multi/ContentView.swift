//
//  ContentView.swift
//  Animal Multi
//
//  Created by Dmitry Sokoltsov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOne = 1
    @State private var numberTwo = 1
    @State private var answerNubmer = []
    @State private var animalsImage: [String] = ["duck", "buffalo", "chick", "moose", "panda", "whale"]
    
    var body: some View {
        NavigationView {
            VStack {
                AnimalImages(image: animalsImage.randomElement() ?? "duck")
                
                VStack{
                    Text("\(numberOne) x \(numberTwo) = ?")
                        .font(.largeTitle)
                        .padding(100)
                }
                HStack {
                    ForEach(0..<4) { number in
                        Button() {
                            correctAnswer(number)
                        }label: {
                            Text("Button")
                                .background(.blue)
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
            .navigationTitle("Animal Multi")
        }
        
    }
    
    func correctAnswer (_ number: Int) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

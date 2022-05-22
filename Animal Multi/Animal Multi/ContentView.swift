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
    private let allMultiplicationTables = Range(1...12)
    private var startGame = false
    
    @State private var animalsImage: [String] = ["duck", "buffalo", "chick", "moose", "panda", "whale"]
    
    @State private var arrayOfQuestions = [Question]()
    @State private var answerArray = [Question]()
    @State public var multiplicationTable = 1
    @State private var currentQuestion = 0
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            if startGame {
                VStack {
                    Text("Pick multiplication table to practice")
                        
                    Picker("Pick multiplication table to practice", selection: $multiplicationTable) {
                        ForEach(1...12, id: \.self) {
                            Text("\($0)")
                        }
                    }.drawGamePicker()
                    
                    
                    VStack{
                        AnimalImages(image: animalsImage.randomElement() ?? "duck")
                        
                    }
                    .padding()
                }
            } else {
                VStack {
                Spacer()
                FirstView()
                    Button(action: newGame) {
                        Label("START", systemImage: "pawprint")
                            .buttonStyle(.bordered)
                            .font(.system(size: 50))
                            .modifier(TitleModifier())
                            .labelStyle(.titleAndIcon)
                            .frame(width: 250, height: 100)
                            .background(.green)
                            .cornerRadius(40)
                    
                }
                Spacer()
                }
            }
            
            
        }
        .navigationTitle("Animal Multy")

        
    }
    
    func correctAnswer (_ number: Int) {
        
    }
    
    func createArrayOfQuestions() {
            for i in 1 ... multiplicationTable {
                for j in 1...12 {
                    let newQuestion = Question(text: "How much is: \(i) * \(j) ?", answer: i * j)
                    arrayOfQuestions.append(newQuestion)
                }
            }
            self.arrayOfQuestions.shuffle()
            self.currentQuestion = 0
            self.answerArray = []
        }
    
    func createAnswersArray() {
            if currentQuestion + 4 < arrayOfQuestions.count {
                for i in currentQuestion ... currentQuestion + 3 {
                    answerArray.append(arrayOfQuestions[i])
                }
            } else {
                for i in arrayOfQuestions.count - 4 ..< arrayOfQuestions.count {
                    answerArray.append(arrayOfQuestions[i])
                }
            }
            self.answerArray.shuffle()
        }
    
    func newGame() {
            self.arrayOfQuestions = []
            self.createArrayOfQuestions()
            self.currentQuestion = 0
            self.answerArray = []
            self.createAnswersArray()
        
        print(arrayOfQuestions)
        print(createAnswersArray())
            
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

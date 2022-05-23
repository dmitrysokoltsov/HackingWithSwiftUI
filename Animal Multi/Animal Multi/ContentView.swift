//
//  ContentView.swift
//  Animal Multi
//
//  Created by Dmitry Sokoltsov on 18.05.2022.
//

import SwiftUI

struct AnswersImage: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .scaleEffect(0.5)
            .frame(width: 80, height: 80)
    }
}

struct AnswerButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 100, alignment: .center)
            .background(Color.gray)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        
    }
}

extension View {
    func drawAnswerButton() -> some View {
        self.modifier(AnswerButton())
    }
}

struct ContentView: View {
    
    @State private var numberOne = 1
    @State private var numberTwo = 1
    private let allMultiplicationTables = Range(1...12)
    @State var startGame = false
    
    @State private var animalsImage: [String] = ["duck", "buffalo", "chick", "moose", "panda", "whale"]
    
    @State private var arrayOfQuestions = [Question]()
    @State private var answerArray = [Question]()
    @State public var multiplicationTable = 1
    @State private var currentQuestion = 0
    @State private var selectedNumber = 0
    @State private var totalScore = 0
    @State private var remainingQuestions = 0
    
    @State private var isCorrect = false
    @State private var isWrong = false
    
    @State private var isShowAlert = false
    @State private var alertTitle = ""
    @State private var buttonAlertTitle = ""
    
    @State private var isWinGame = false
    
    
    
    
    var body: some View {
            
            if startGame {
                VStack {
                    Text("\(arrayOfQuestions[currentQuestion].text)")
                    VStack{
                        AnimalImages(image: animalsImage.randomElement() ?? "duck")
                        VStack {
                            ForEach (0 ..< 4, id: \.self) { number in
                                
                                HStack {
                                    Button(action: {
                                        withAnimation {
                                            
                                        
                                        self.checkAnswer(number)
                                        }
                                    }) {
                                        AnswersImage(image: self.imagesName[number])
                                            .padding()
                                        
                                        Text("\(self.answerArray[number].answer)")
                                            .foregroundColor(Color.black)
                                            .font(.title)
                                    }
                                .drawAnswerButton()
                                    .rotation3DEffect(.degrees(self.isCorrect && self.selectedNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                    .rotation3DEffect(.degrees(self.isWrong && self.selectedNumber == number ? 180 : 0), axis: (x: 0, y: 0, z: 0.5))
                                }
                            }
                        }
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
            self.startGame.toggle()
        
        print(arrayOfQuestions)
        print(createAnswersArray())
            
        }
    
    func checkAnswer(_ number: Int) {
        self.selectedNumber = number
        if answerArray[number].answer == arrayOfQuestions[currentQuestion].answer {
            self.isCorrect = true
            self.remainingQuestions -= 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if self.remainingQuestions == 0 {
                    self.alertTitle = "You win"
                    self.buttonAlertTitle = "Start new game"
                    self.totalScore += 1
                    self.isWinGame = true
                    self.isShowAlert = true
                } else {
                    self.totalScore += 1
                    self.alertTitle = "Correct!!!"
                    self.buttonAlertTitle = "New Question"
                    self.isShowAlert = true
                }
            }
        } else {
            isWrong = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alertTitle = "Wrong!!!"
                self.buttonAlertTitle = "Tray again"
                self.isShowAlert = true
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

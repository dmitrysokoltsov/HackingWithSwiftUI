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
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("\(numberOne) x \(numberTwo) = ?")
                        .font(.largeTitle)
                        .padding()
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

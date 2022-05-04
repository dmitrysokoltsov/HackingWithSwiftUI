//
//  ContentView.swift
//  Milestone
//
//  Created by Dmitry Sokoltsov on 04.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    struct ItemsLabel: View {
            var text: String
            var body: some View {
                Text(text)
                    .font(.system(size: 80))
            }
            
        }
    
    @State private var select = "You"
    @State private var resualt = ""
    @State private var text = ""
    @State private var enemy = "🧟‍♂️"
    
    var items = ["🪨","📃","✂️"]
    
    var body: some View {
        ZStack {
            Color.secondary.ignoresSafeArea()
            VStack {
                Text("\(select) VS \(enemy)")
                    .font(.system(size: 80))
                    .padding()
                Text("\(text)")
                    .font(.system(size: 80))
                    .padding()
                
                Group {
                    Text("Select item")
                        .font(.system(size: 30))
                }
            HStack(spacing: 20) {
                
                Button() {
                    select = "🪨"
                    rock(select: select)
                }label: {
                    ItemsLabel(text: "🪨")
                        
                }
                Button() {
                    select = "📃"
                    paper(select: select)
                }label: {
                    ItemsLabel(text: "📃")
                }
                Button() {
                    select = "✂️"
                    scissors(select: select)
                }label: {
                    ItemsLabel(text: "✂️")
                }
            }
            .padding()
            }
            
        }
        
        
       
    }
    
    func rock(select: String) {
        enemy = items.randomElement() ?? ""
        
        if enemy == "📃" {
            text = "Lose"
        } else if enemy == "✂️"{
            text = "Win"
        } else if enemy == "🪨" {
            text = "Draw"
        }
        print(select,$enemy)
    }
    
    func paper(select: String) {
        enemy = items.randomElement() ?? ""
        
        if enemy == "📃" {
            text = "Draw"
        } else if enemy == "✂️"{
            text = "Lose"
        } else if enemy == "🪨" {
            text = "Win"
        }
        print(select,enemy)
    }
    
    func scissors(select: String) {
        enemy = items.randomElement() ?? ""
        
        if enemy == "📃" {
            text = "Win"
        } else if enemy == "✂️"{
            text = "Draw"
        } else if enemy == "🪨" {
            text = "Lose"
        }
        print(select,enemy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

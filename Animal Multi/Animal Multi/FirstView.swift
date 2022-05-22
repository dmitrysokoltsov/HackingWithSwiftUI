//
//  FirstView.swift
//  Animal Multi
//
//  Created by Dmitry Sokoltsov on 22.05.2022.
//

import SwiftUI

struct TitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("ArialRoundedMTBold", size: 18))
            .foregroundColor(Color.black)
        
    }
}

struct FirstView: View {
    
    @State public var multiplicationTable = 1
    @State private var countOfQuestions = "5"
    
    
    
    let variantsOfQuestions = ["5", "10", "20", "All"]
    
    var body: some View {
        
        VStack() {
            
            Group {
                Text("Pick multiplication table to practice")
                    .modifier(TitleModifier())
                
                
                Picker("Pick multiplication table to practice", selection: $multiplicationTable) {
                    ForEach(1...12, id: \.self) {
                        Text("\($0)")
                    }
                }.drawGamePicker()
                
            }
            Group {
                Text("How many question you want to be asked?")
                    .modifier(TitleModifier())
                
                Picker("How many question you want to be asked?", selection: $countOfQuestions) {
                    ForEach(variantsOfQuestions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .drawGamePicker()
            }
        }
    }
}

struct GamePicker: ViewModifier {
    
    func body(content: Content) -> some View {
        
        withAnimation(.spring()) {
            content
                .pickerStyle(SegmentedPickerStyle())
                .colorMultiply(.green)
                .padding(.bottom, 50)
        }
    }
}

extension View {
    func drawGamePicker() -> some View {
        self.modifier(GamePicker())
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

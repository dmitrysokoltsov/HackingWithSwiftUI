//
//  ContentView.swift
//  TempConvertor
//
//  Created by Dmitry Sokoltsov on 29.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed: Double = 0.0
    @State private var isEditing = false
    
    
    var faringate: Int {
        let calculate = Int(speed) * 9 / 5 + 32
        return calculate
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                    Section {
                        Text("""
                             Celcium: \(Int(speed))
                             
                             Fahrenheit: \(faringate)
                             """)
                        .font(.headline).bold()
                        
                        .foregroundColor(isEditing && speed > 50 ? .red : .black)
                    }header: {
                        Text("Temperature celsium and fahrenheit")
                    }
                Section {
                    Slider(
                        value: $speed,
                        in: 0...100,
                        step: 1
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                }header: {
                    Text("Select the celsius temperature")
                }
                
                    }
                    
            .navigationTitle("Temp Convertor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

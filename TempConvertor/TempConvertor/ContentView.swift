//
//  ContentView.swift
//  TempConvertor
//
//  Created by Dmitry Sokoltsov on 29.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    
    var body: some View {
        NavigationView {
            
            Form {
                Text("hello")
                Slider(
                        value: $speed,
                        in: 0...100,
                        step: 5
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    Text("\(speed)")
                        .foregroundColor(isEditing ? .red : .blue)
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

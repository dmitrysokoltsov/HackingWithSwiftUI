import SwiftUI
import Foundation

struct ContentView: View {
    @State private var checkAmount: Double?
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    
    let tipPersentages = [0,10,15,20,25]
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount ?? 0.0) / 100 * tipSelection
        let grandTotal = (checkAmount ?? 0.0) + tipValue
        let amountPercentage = grandTotal / peopleCount
        
        
        return amountPercentage
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Select number of people", selection: $numberOfPeople) {
                        ForEach(2..<51) {
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPersentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            //Dismiss the keyboard when you start scrolling
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

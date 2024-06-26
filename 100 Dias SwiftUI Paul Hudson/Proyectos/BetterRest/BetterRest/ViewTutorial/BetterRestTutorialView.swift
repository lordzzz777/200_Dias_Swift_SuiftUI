//
//  BetterRestView.swift
//  BetterRest
//
//  Created by Esteban Perez Castillejo on 29/5/24.
//

import SwiftUI

struct BetterRestTutorialView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack{
            Text("Hello, World!") .padding()
            DatePicker("Intruduzca fecha", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
            DatePicker("Intruduzca fecha", selection: $wakeUp, in: Date.now...).labelsHidden()
            
            Stepper("\(sleepAmount.formatted()) horas", value: $sleepAmount, in: 4...12, step: 0.25)
        }
        .padding()
    }
    
    func exapleDate(){
        /// Crear una segunda instancia de fecha establecida en un día en segundos a partir de ahora
        let tomrrow = Date.now.addingTimeInterval(86400)
        
        /// Crear un rango de esos dos
        _ = Date.now...tomrrow
    }
}

#Preview {
    BetterRestTutorialView()
}

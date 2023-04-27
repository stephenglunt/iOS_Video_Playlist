//
//  ChangingGradient.swift
//  MyMotivation
//
//  Created by Stephen Glunt on 4/26/23.
//

import SwiftUI

struct ChangingGradient: View {
    @State private var currentTime = Date()
    
    private let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    var body: some View {
        let colors = calculateColors()
        LinearGradient(gradient: Gradient(colors: [colors.0, colors.1]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            .onReceive(timer) { _ in
                currentTime = Date()
            }
    }
    private func calculateColors() -> (Color, Color) {
            let hour = Calendar.current.component(.hour, from: currentTime)

            if hour >= 5 && hour < 10 { // Morning
                return (Color.blue, Color.yellow)
            } else if hour >= 10 && hour < 16 { // Afternoon
                return (Color.yellow, Color.orange)
            } else if hour >= 16 && hour < 20 { // Evening
                return (Color.orange, Color.red)
            } else { // Night
                return (Color.red, Color.black)
            }
        }
}

struct ChangingGradient_Previews: PreviewProvider {
    static var previews: some View {
        ChangingGradient()
    }
}

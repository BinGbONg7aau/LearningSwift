//
//  Forecast.swift
//  NikolajLearnsSwift
//
//  Created by Nikolaj van Gool on 02/07/2026.
//

import SwiftUI

struct Forecast: View {
    var body: some View {
        Text("Forecast:")
            .font(.title)
        HStack{
            DayForecast(day: "Mon", high: 70, low: 50, isRainy: false)
            DayForecast(day: "Tue", high: 50, low: 30, isRainy: true)
        }
    }
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
           if isRainy {
               return Color.white
           } else {
               return Color.yellow
           }
       }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
            Text("High: \(high)")
            Text("Low: \(low)")
        }
        .padding()
        .background(Color.blue, in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    Forecast()
}

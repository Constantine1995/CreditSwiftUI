//
//  ContentView.swift
//  TestApp
//
//  Created by Constantine Likhachov on 06.01.2021.
//

import SwiftUI

struct ContentView: View {
    var credits: [String: [CreditBanks]] {
        .init(grouping: creditResponse, by: {String($0.id)})
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.white, Color("Encycolorpedia")]), startPoint: .topLeading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Лучшие предложения")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(.leading, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 10) {
                        ForEach(self.credits.keys.sorted(), id: \.self) { key in
                            ContentRow(credits: self.credits[key]!)
                        }.listRowInsets(EdgeInsets())
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

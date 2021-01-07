//
//  ContentRow.swift
//  TestApp
//
//  Created by Constantine Likhachov on 06.01.2021.
//

import SwiftUI

struct ContentRow: View {
    
    var credits: [CreditBanks]
    
    @State var showContent = false
    
    var body: some View {
        ScrollView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack() {
                        Button(action: { self.showContent.toggle() }) {
                            ForEach(credits) { credit in
                                CourseView(credit: credit)
                            }
                            .frame(width: 350, height: 220)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
            }
        }
    }
    
}
struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow(credits: Array(creditResponse))
    }
}


struct CourseView: View {
    var credit: CreditBanks
    var body: some View {
        // Create CreditItem
        VStack(alignment: .center) {
            VStack(spacing: 8.0) {
                Image(credit.image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 60, alignment: .top)
                
                HStack {
                    setTitleText(text: "Ставка")
                    Spacer()
                    setValueText(text: credit.rate)
                }
                HStack {
                    setTitleText(text: "Первый кредит")
                    Spacer()
                    setValueText(text: credit.firstOverPayment)
                }
                HStack {
                    setTitleText(text: "Второй кредит")
                    Spacer()
                    setValueText(text: credit.secondOverPayment)
                }
                HStack {
                    setTitleText(text: "Срок")
                    Spacer()
                    setValueText(text: credit.term)
                }
                HStack {
                    setTitleText(text: "Возраст")
                    Spacer()
                    setValueText(text: credit.age)
                }
            }
        }
        .padding(16)
        .frame(width: 350, height: 250)
        .background(Color.white)
        .cornerRadius(30)
        //        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 0)
        
    }
    
    func setTitleText(text: String, fontWeight: Font.Weight? = .medium) -> Text {
        return Text(text)
            .font(.headline)
            .fontWeight(fontWeight)
            .foregroundColor(.black)
    }
    
    func setValueText(text: String, fontWeight: Font.Weight? = .light) -> Text {
        return Text(text)
            .font(.headline)
            .fontWeight(.light)
            .foregroundColor(.gray)
    }
}

extension View {
    func print(_ value: Any) -> Self {
        Swift.print(value)
        return self
    }
}

//
//  CreditBanks.swift
//  TestApp
//
//  Created by Constantine Likhachov on 06.01.2021.
//

import SwiftUI

struct CreditBanks: Hashable, Codable, Identifiable {
    var id: Int
    var image: String
    var rate: String
    var firstOverPayment: String
    var secondOverPayment: String
    var term: String
    var age: String
}

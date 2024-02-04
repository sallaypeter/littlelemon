//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import Foundation

struct MenuItem: Decodable {
    var title: String
    var image: String
    var price: String
    var id: Int
    var description: String
    var category: String
}

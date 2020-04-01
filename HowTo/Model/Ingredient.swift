//
//  Ingredient.swift
//  HowTo
//
//  Created by Paulo José on 31/03/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

struct Ingredient: Equatable, Hashable {
    var description: String
    
    static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.description == rhs.description
    }
}

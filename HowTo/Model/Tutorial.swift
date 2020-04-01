//
//  Tutorial.swift
//  HowTo
//
//  Created by Paulo José on 31/03/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

struct Tutorial {
    var name: String
    var ingredients: Set<Ingredient>
    var steps: [Step]
    
    init(with name: String, ingredients: Set<Ingredient>) {
        self.name = name
        self.ingredients = ingredients
        self.steps = []
    }
    
    mutating func add(ingredient: Ingredient) {
        self.ingredients.insert(ingredient)
    }
    
    mutating func remove(ingredient: Ingredient) {
        self.ingredients.remove(ingredient)
    }
    
    mutating func add(step: Step) {
        self.steps.append(step)
    }
    
    mutating func remove(step: Step) {
        self.steps = self.steps.filter({$0 != step})
    }
    
    mutating func move(step: Step, to position: Int) {
        guard let index = self.steps.firstIndex(of: step) else {
            return
        }
        let step = self.steps.remove(at: index)
        self.steps.insert(step, at: position)
    }
    
}

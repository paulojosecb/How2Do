//
//  Step.swift
//  HowTo
//
//  Created by Paulo José on 31/03/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import Foundation

struct Step: Equatable {
    var description: String
    var image: Data
    
    static func ==(lhs: Step, rhs: Step) -> Bool {
        return lhs.description == rhs.description && lhs.image == rhs.image
    }
}

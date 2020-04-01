//
//  TutorialTests.swift
//  HowToTests
//
//  Created by Paulo José on 31/03/20.
//  Copyright © 2020 Paulo José. All rights reserved.
//

import XCTest
@testable import HowTo

class TutorialTests: XCTestCase {
    
    var tutorial: Tutorial?
    var ingredient: Ingredient?
    var step0: Step?
    var step1: Step?
    var step2: Step?


    override func setUp() {
        tutorial = Tutorial(with: "Tutorial 1", ingredients: [])
        ingredient = Ingredient(description: "Ingredient 1")
        
        let imageData = UIImage(named: "correct")?.pngData()
        
        step0 = Step(description: "Step0", image: imageData!)
        step1 = Step(description: "Step1", image: imageData!)
        step2 = Step(description: "Step2", image: imageData!)


        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddIngredient() {
        guard var tutorial = tutorial, let ingredient = ingredient else {
            XCTFail()
            return
        }
        
        tutorial.add(ingredient: ingredient)
        XCTAssert(tutorial.ingredients.contains(ingredient))
    }
    
    func testRemoveIngredient() {
        guard let ingredient = ingredient else {
            XCTFail()
            return
        }
        
        var tutorial = Tutorial(with: "Tutorial 1", ingredients: [ingredient])
        
        tutorial.add(ingredient: ingredient)
        XCTAssert(tutorial.ingredients.contains(ingredient))

        tutorial.remove(ingredient: ingredient)
        XCTAssert(!tutorial.ingredients.contains(ingredient))
    }
    
    func testAddStep() {
        guard var tutorial = tutorial, let step1 = step1 else {
            XCTFail()
            return
        }
        
        tutorial.add(step: step1)
        XCTAssert(tutorial.steps.contains(step1))
    }
    
    func testRemoveStep() {
        guard let step0 = step0 else {
            XCTFail()
            return
        }
        
        var tutorial = Tutorial(with: "Tutorial 1", ingredients: [])
        
        tutorial.add(step: step0)
        XCTAssert(tutorial.steps.contains(step0))

        tutorial.remove(step: step0)
        XCTAssert(!tutorial.steps.contains(step0))
    }
    
    func testIfAddMultipleStepsLetsStepsOnOrder() {
        guard let step0 = step0, let step1 = step1 else {
            XCTFail()
            return
        }
        
        var tutorial = Tutorial(with: "Tutorial 1", ingredients: [])
        
        tutorial.add(step: step0)
        tutorial.add(step: step1)
        
        XCTAssert(tutorial.steps.firstIndex(of: step0) == 0)
        XCTAssert(tutorial.steps.firstIndex(of: step1) == 1)
    }
    
    func testIfMoveStepToAnotherPositionChangesStepsOrder() {
        guard let step0 = step0, let step1 = step1, let step2 = step2 else {
            XCTFail()
            return
        }
        
        var tutorial = Tutorial(with: "Tutorial 1", ingredients: [])
        
        tutorial.add(step: step0)
        tutorial.add(step: step1)
        tutorial.add(step: step2)

        
        tutorial.move(step: step2, to: 0)
        
        XCTAssert(tutorial.steps.firstIndex(of: step2) == 0)
        XCTAssert(tutorial.steps.firstIndex(of: step0) == 1)
        XCTAssert(tutorial.steps.firstIndex(of: step1) == 2)
    }
    
    func testIfTryToMoveAStepWhichIsNotInTutorialDoesNotChangeStepsOrder() {
        guard let step0 = step0, let step1 = step1, let step2 = step2 else {
            XCTFail()
            return
        }
        
        var tutorial = Tutorial(with: "Tutorial 1", ingredients: [])
        
        tutorial.add(step: step0)
        tutorial.add(step: step1)

        tutorial.move(step: step2, to: 0)
        
        XCTAssert(tutorial.steps.firstIndex(of: step0) == 0)
        XCTAssert(tutorial.steps.firstIndex(of: step1) == 1)
        XCTAssert(tutorial.steps.count == 2)
        XCTAssert(!tutorial.steps.contains(step2))
    }

}

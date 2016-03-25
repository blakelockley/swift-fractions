//
//  FractionsTests.swift
//  FractionsTests
//
//  Created by Blake Lockley on 25/03/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import XCTest
@testable import Fractions

class FractionsTests: XCTestCase {
  
  func testCreatingFractions() {
    //Fractions in simpliest form
    XCTAssertEqual(Fraction(2, over: 4), Fraction(1, over: 2))
    
    //Fractions from IntegerTypeLiterals
    XCTAssertEqual(4 as Fraction, Fraction(4, over: 1))
    
    //Fractions created using the division operator
    XCTAssertEqual(1 / 4 as Fraction, Fraction(1, over: 4))
  }
  
  func testArithmaticOperationsOnFractions() {
    //Adding Fractions
    XCTAssertEqual(1 / 2 + 1 / 8 as Fraction, 5 / 8 as Fraction)
    
    //Subtracting Fractions
    XCTAssertEqual(5 / 8 - 1 / 8 as Fraction, 1 / 2 as Fraction)
    
    //Multiplying Fractions
    XCTAssertEqual((1 / 2) * (1 / 2) as Fraction, 1 / 4 as Fraction)
    
    //Dividing Fractions
    XCTAssertEqual(1 / 4 / (1 / 2), 1 / 2 as Fraction)
  }
  
  func testComparisonOfFractions() {
    //Fractions are equal
    XCTAssertTrue(1 / 2 as Fraction == 1 / 2 as Fraction)
    XCTAssertTrue(1 / 2 as Fraction == 2 / 4 as Fraction)
    XCTAssertFalse(1 / 2 as Fraction == 3 / 4 as Fraction)

    //Fractions are comparable
    XCTAssertTrue((1 / 2 as Fraction) < (3 / 4 as Fraction))
    XCTAssertTrue((1 / 2 as Fraction) > (1 / 8 as Fraction))
    XCTAssertTrue((1 / 2 as Fraction) >= (1 / 2 as Fraction))
    XCTAssertTrue((1 / 2 as Fraction) <= (3 / 4 as Fraction))
  }
  
  func testConvertingFractionsToNumbers() {
    //Converting to Int
    XCTAssertEqual(Int(4 as Fraction), 4)
    
    //Converting to Floating Point Number
    XCTAssertEqual(Float(1 / 2 as Fraction), 0.5)
    XCTAssertEqualWithAccuracy(Double(1 / 3 as Fraction), 0.33, accuracy: 0.01)
  }
}

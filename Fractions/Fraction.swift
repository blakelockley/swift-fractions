//
//  Fraction.swift
//  Fractions
//
//  Created by Blake Lockley on 25/03/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

struct Fraction {
  let numerator: Int
  let denominator: Int
  
  init(_ n: Int, over d: Int) {
    let g = gcd(n, d)
    numerator = n / g
    denominator = d / g
  }
  
  var reciprocal: Fraction {
    return Fraction(denominator, over: numerator)
  }
}

private func gcd(a: Int, _ b: Int) -> Int {
  return b == 0 ? a : gcd(b, a % b)
}

private func lcm(a: Int, _ b: Int) -> Int {
  return (a * b) / gcd(a, b)
}

//MARK: Fraction Protocol Conformance
extension Fraction: CustomStringConvertible {
  var description: String {
    return "\(numerator)/\(denominator)"
  }
}

extension Fraction: IntegerLiteralConvertible {
  init(integerLiteral value: Int) {
    numerator = value
    denominator = 1
  }
}

extension Fraction: Equatable {}
func == (lhs: Fraction, rhs: Fraction) -> Bool {
  return lhs.numerator * rhs.denominator == rhs.numerator * lhs.denominator
}

extension Fraction: Comparable {}
func < (lhs: Fraction, rhs: Fraction) -> Bool {
  let l = lcm(lhs.denominator, rhs.denominator)
  let lnum = lhs.numerator * (l / lhs.denominator)
  let rnum = rhs.numerator * (l / rhs.denominator)
  
  return lnum < rnum
}

//MARK: Fraction arithmatic operators
func * (lhs: Fraction, rhs: Fraction) -> Fraction {
  return Fraction(lhs.numerator * rhs.numerator, over: lhs.denominator * rhs.denominator)
}

func / (lhs: Fraction, rhs: Fraction) -> Fraction {
  return lhs * rhs.reciprocal
}

func + (lhs: Fraction, rhs: Fraction) -> Fraction {
  return Fraction(lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator,
                  over: rhs.denominator * lhs.denominator)
}

func - (lhs: Fraction, rhs: Fraction) -> Fraction {
  return lhs + rhs * -1
}

//MARK: Init's for numer types.
extension Int {
  init(_ fraction: Fraction) {
    self = fraction.numerator / fraction.denominator
  }
}

extension Double {
  init(_ fraction: Fraction) {
    self = Double(fraction.numerator) / Double(fraction.denominator)
  }
}

extension Float {
  init(_ fraction: Fraction) {
    self = Float(Double(fraction))
  }
}

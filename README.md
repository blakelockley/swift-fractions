# SwiftFractions
Easy to use and precise fractions in Swift. 

Fractions allow for numbers to be respense percisely without having to worry about the inaccuracy of floating point numbers.

Fractions can be easily made like so thanks to confomrace to the IntegerTypeLiteral protocol:
```swift
let threeOnTen: Fraction = 3 / 10
let sevenOnEight = 7 / 8 as Fraction
let threeOnFive = Fraction(3, over: 5)
let wholeFour = 4 as Fraction // 4/1
```

Fractions will always be in simpliest form
```swift
let half = 450 / 900 as Fraction
print(half) // prints: 1/2
```

Fractions supports arithmatic operators
```swift
let threeOnEight = 1 / 8 + 1 / 4 as Fraction // 3/8
let sevenOnEight = 8 - 1 / 8 // 7/8
let eightOnFifteen = (4 / 5) * (2 / 3) as Fraction // 8/15
let twoThirds = (1 / 2) / (3 / 4) as Fraction // 2/3
```

Fractions can be easily compared
```swift
let theSame = 1 / 2 as Fraction == 2 / 4 as Fraction //true
let lessThan = 1 / 8 < 1 / 2 //true
```

Fractions can be easily converted to noraml number data types
```swift
let four = Int(5 / 4 as Fraction) // 4 notice the floor value is taken.
let fourPointTwoFive = Float(5 / 4 as Fraction) // 4.25

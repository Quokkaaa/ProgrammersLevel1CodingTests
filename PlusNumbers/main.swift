//
//  main.swift
//  PlusNumbers
//
//  Created by LIMGAUI on 2021/12/29.
//

import Foundation

"""
0 <= A <= 99
- 10 보다 작을 경우 앞에 0 을 붙여 두자리수로 만들고 각 자리의 숫자를 더한다.
- 그다음 주어진 수의 가장 오른쪽 수와 구한 합의 가장 오른쪽자리수를 이어 붙인다. 1, 0 = 10

"""

func plusCycle(_ number: Int) -> Int {
    guard 0 <= number && number <= 99 else { return 0 }
    // 0부터 99필터 또는 0붙임 조건
    var usingNumbers = [String]()
    var rightNumber = 0
    var sumNumber = 0
    
    if number < 10 {
        usingNumbers.append((String(number) + "0"))
    } else {
        usingNumbers.append((String(number)))
    }
    // 숫자를 개별로 분리한 후 numbers에 담는다.
    
    var numbers = usingNumbers.filter { number -> Bool in
        if let unwrappedNumber = Int(number) {
            sumNumber += unwrappedNumber
            rightNumber = unwrappedNumber
        }
        return Int(number) != 0
    }
    // 숫자 합을 sum에 담는다.
    
    // 주어진 오른쪽 숫자와 합의 오른쪽 수를 붙여 lastOperationValue에 담는다.
    let lastOperationValue = String(sumNumber) + String(numbers.removeLast())
    
    if let result = Int(lastOperationValue) {
        return result
    } else {
        return 0
    }
}

let test = 34
// array값이 왜 분리된 요소들로 나오는지.
let array = Array(String(test))
// String -> Int 로 형변환하는 방법

// String.Element오류가 왜그런지 알아보기
print(plusCycle(26))

let string = "Hello!"
let arrayStrings = Array(String(string))

//var numbers = Array(String(number))
//// 숫자 합을 sum에 담는다.
//
//numbers.map { (number: String.Element) -> Int in
//    var intNumbers = 0
//    return intNumbers
//}

//  main.swift
//  PlusNumbers
//  Created by LIMGAUI on 2021/12/29.

import Foundation

"""
0 <= A <= 99
- 10 보다 작을 경우 앞에 0 을 붙여 두자리수로 만들고 각 자리의 숫자를 더한다.
- 그다음 주어진 수의 가장 오른쪽 수와 구한 합의 가장 오른쪽자리수를 이어 붙인다. 1, 0 = 10
"""

func plusCycle(_ number: Int) -> Int {
    // 0부터 99필터 또는 0붙임 조건
    guard 0 <= number && number <= 99 else { return 0 }
    // 연산하고 값을 다룰때 사용할 저장변수들
    var numbers = [String]()
    var sumNumber = 0
    // 10미만일 경우 두자리수로 만들어주는 조건
    if number < 10 {
        numbers.append((String(number) + "0"))
    } else {
        numbers.append((String(number)))
    }
    // 숫자를 개별로 분리한 후 numbers에 담는다.
    var numberArray = Array(String(numbers[0]))
    numbers.removeFirst()
    numberArray.forEach{ number in numbers.append(String(number)) }
    // 숫자 합을 sum에 담는다.
    numbers.forEach { number in sumNumber += Int(number) ?? 0 }
    var sumRightNumber = Array(String(sumNumber))
    // 주어진 오른쪽 숫자와 합의 오른쪽 수를 붙여 lastOperationValue에 담는다.
    let lastOperationValue = String(numberArray.removeLast()) + String(sumRightNumber.removeLast())
    
    if let result = Int(lastOperationValue) {
        return result
    } else {
        return 0
    }
}
print(plusCycle(98))

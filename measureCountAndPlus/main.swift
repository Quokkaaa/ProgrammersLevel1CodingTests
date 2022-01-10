//  main.swift
//  measureCountAndPlus
//  Created by LIMGAUI on 2022/01/10.

import Foundation

// 입출력 예
"""
left - right - result
13      17      43
24      27      52

수    약수                 약수의 개수
13    1, 13                  2
14    1, 2, 7, 14            4
15    1, 3, 5, 15            4
16    1, 2, 4, 8, 16         5
17    1, 17                  2

따라서, 13 + 14 + 15 - 16 + 17 = 43을 return 해야 합니다.
"""

func solution(_ left: Int, _ right: Int) -> Int {
    var sumNumbers = [Int]()
    var measureNumber = [Int]()
    guard 1 <= left && right <= 1000 else { return 0 }
    // 나눠서 0이 되는 숫자를 배열에 담아 약수의 개수를 구하자.
    for number in left...right {
        for divideNumber in 1...number {
            if number % divideNumber == 0 {  measureNumber.append(divideNumber) }
            if divideNumber == number {
                if measureNumber.count % 2 == 0 {
                    sumNumbers.append(number)
                    measureNumber.removeAll()
                } else {
                    sumNumbers.append(-number)
                    measureNumber.removeAll()
                }
            }
        }
    }
    // 약수의 개수가 홀수 였던 수는 - 짝수였던 수는 +로 연산한다.
    let result = sumNumbers.reduce(0) { $0 + $1 }
    // 연산한 최종 덧셈을 return한다.
    return result
}
print(solution(24, 27))

//  main.swift
//  mockExam
//  Created by LIMGAUI on 2021/11/27

import Foundation
// MARK: 모의고사 문제

"""
1. 문제 설명
수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.

1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...

1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

2. 제한 조건
- 시험은 최대 10,000 문제로 구성되어있습니다.
- 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
- 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.

- 입출력 예)
answers    return
[1,2,3,4,5]    [1]
[1,3,2,4,2]    [1,2,3]

- 입출력 예)
설명
입출력 예 #1

수포자 1은 모든 문제를 맞혔습니다.
수포자 2는 모든 문제를 틀렸습니다.
수포자 3은 모든 문제를 틀렸습니다.
따라서 가장 문제를 많이 맞힌 사람은 수포자 1입니다.

입출력 예 #2 )

모든 사람이 2문제씩을 맞췄습니다.
"""
// 문제 찍는 방식
var firstSuPoJa = [1,2,3,4,5]
var secondSuPoJa = [2,1,2,3,2,4,2,5]
var thirdSuPoJa = [3,3,1,1,2,2,4,4,5,5]

// 문제를 가장 많이 맞춘 사람을 return에 담는다.
func solution(_ answers: [Int]) -> [Int] {
    var firstSuPoJaGetRightCounter = 0
    var firstSuPoJaIndexCounter = 0
    
    var secondSuPoJaGetRightCounter = 0
    var secondSuPoJaIndexCounter = 0
    
    var thirdSuPoJaGetRightCounter = 0
    var thirdSuPoJaIndexCounter = 0
    
    var higherScore: [Int] = []
    
    // 문제와 정답을 비교
    for i in 0..<answers.count {
        if firstSuPoJa[firstSuPoJaIndexCounter] == answers[i] {
            firstSuPoJaGetRightCounter += 1
            firstSuPoJaIndexCounter += 1
        }
        if secondSuPoJa[secondSuPoJaIndexCounter] == answers[i] {
            secondSuPoJaGetRightCounter += 1
            secondSuPoJaIndexCounter += 1
        }
        if thirdSuPoJa[thirdSuPoJaIndexCounter] == answers[i] {
            thirdSuPoJaGetRightCounter += 1
            thirdSuPoJaIndexCounter += 1
        }
        // 문제를 찍는 숫자를 문제의 수만큼 반복하기위해 index수가 max일 경우 초기화해준다.
        if firstSuPoJaIndexCounter == 4 {
            firstSuPoJaIndexCounter = 0
        }
        if secondSuPoJaIndexCounter == 8 {
            secondSuPoJaIndexCounter = 0
        }
        if thirdSuPoJaIndexCounter == 10 {
            thirdSuPoJaIndexCounter = 0
        }
    }
    
    // 1등 반환 및 정렬
    if firstSuPoJaGetRightCounter > secondSuPoJaGetRightCounter, secondSuPoJaGetRightCounter > thirdSuPoJaGetRightCounter {
        higherScore.append(1)
    }
    
    if secondSuPoJaGetRightCounter > thirdSuPoJaGetRightCounter {
        higherScore.append(2)
    } else {
        higherScore.append(3)
    }
    
    //순위정렬
    return higherScore.sorted()
}

// 제한 조건
func generateAnswers() -> [Int] {
    var answers: [Int] = []
    for _ in 1...10000 {
        answers.append(Int.random(in: 1...5))
    }
    return answers
}

let examAnswer = generateAnswers()
print(solution(examAnswer))

//
//  main.swift
//  2016Year
//
//  Created by LIMGAUI on 2021/12/09.

import Foundation

"""
# 문제 설명
2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT
입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.

# 제한 조건
2016년은 윤년입니다.
2016년 a월 b일은 실제로 있는 날입니다. (13월 26일이나 2월 45일같은 날짜는 주어지지 않습니다)

# 입출력 예
a    b    result
5    24    "TUE"
"""

func solution(_ month:Int, _ day:Int) -> String {
    guard (1 <= month && month <= 12), (1 <= day && day <= 31) else {
        return "월은 1~12이내로, 일은 1~31이내로 입력해주세요. 단, 2월은 29일까지입니다."
    }
    let yearDividedByMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
    let dayOfTheWeek = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    var sumDays = 0
    
    // 방법
    // 1. 1월 7일미만 인 경우의 로직(7로 나눌수 없음)
    if month == 1, (1 <= day && day < 7) {
        sumDays += day
    } else {
        // 2. 총합 Day수가 7이상 인 경우의 로직
        // 2-1, yearDividedByMonth[0~4]의 수를 더한다.
        sumDays += day
        for i in 0...month-2 {
            sumDays += yearDividedByMonth[i]
        }
    }
    // 2-2, sumDays를 7로 나눈다
    // 2-3, 나머지에 따라 요일을 값을 할당한다.
    // 나머지가 0=목, 1=금, 2=토, 3=일, 4=월, 5=화, 6=수,
    switch sumDays % 7 {
    case 0:
        return dayOfTheWeek[0]
    case 1:
        return dayOfTheWeek[1]
    case 2:
        return dayOfTheWeek[2]
    case 3:
        return dayOfTheWeek[3]
    case 4:
        return dayOfTheWeek[4]
    case 5:
        return dayOfTheWeek[5]
    case 6:
        return dayOfTheWeek[6]
    default:
        return "오류"
    }
}
print(solution(1, 4))

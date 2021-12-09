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

func solution(_ a:Int, _ b:Int) -> String {
    let months = [1,2,3,4,5,6,7,8,9,10,11,12]
    let yearDividedByMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
    let dayOfTheWeek = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let dayOFTheWeekCounter = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    var month = ""
    var day = ""
    for i in 0..<months.count {
        if months[i] == a, (1 <= a && a <= 12){
            month += "\(months[i])"
        } else {
            print("a는 1~12숫자로 이내로 입력해주세요")
        }
    }
    // 5월 24일 = 176 경우
    
    // 방법1 - 1월부터 날짜를 계산한 176일을 2016년도가 1월1일이 금요일로 시작하니 금~목 까지의 배열수로 카운트해서 값을 추출한다.
    
    //방법2
    // 1. 총합 Day수가 7미만 인 경우의 로직
    
    // 1-2, 0=목요일, 1=금, 2=토, 3=일, 4=월, 5=화, 6=수 로 한정해서 요일을 추출한다.
    
    // 2. 총합 Day수가 7이상 인 경우의 로직
    // 2-1, yearDividedByMonth[0~4]의 수를 더한다.
    
    // 2-2, 176을 7로 나눈다
    
    // 2-3, 나머지에 따라 요일을 값을 할당한다.
    return " "
}

//
//  main.swift
//  changeEnglishWords
//
//  Created by LIMGAUI on 2021/12/15.
//

import Foundation

"""
네오와 프로도가 숫자놀이를 하고 있습니다. 네오가 프로도에게 숫자를 건넬 때 일부 자릿수를 영단어로 바꾼 카드를 건네주면 프로도는 원래 숫자를 찾는 게임입니다.

다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.

1478 → "one4seveneight"
234567 → "23four5six7"
10203 → "1zerotwozero3"

이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.

참고로 각 숫자에 대응되는 영단어는 다음 표와 같습니다.

숫자    영단어
0    zero
1    one
2    two
3    three
4    four
5    five
6    six
7    seven
8    eight
9    nine

# 제한사항)
1 ≤ s의 길이 ≤ 50
s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.

# 입출력 예)
        s             result
"one4seveneight"      1478
"23four5six7"         234567
"2three45sixseven"    234567
"123"                 123

입출력 예 설명
입출력 예 #1

문제 예시와 같습니다.
입출력 예 #2

문제 예시와 같습니다.
입출력 예 #3

"three"는 3, "six"는 6, "seven"은 7에 대응되기 때문에 정답은 입출력 예 #2와 같은 234567이 됩니다.
입출력 예 #2와 #3과 같이 같은 정답을 가리키는 문자열이 여러 가지가 나올 수 있습니다.
입출력 예 #4

s에는 영단어로 바뀐 부분이 없습니다.

1478 → "one4seveneight"
234567 → "23four5six7"
10203 → "1zerotwozero3"

0    zero
1    one
2    two
3    three
4    four
5    five
6    six
7    seven
8    eight
9    nine
"""

func solution(_ s: String) -> Int {
    let stringNumbersDictionary: [String: Int] = ["zero":0,"one":1,"two":2,"three":3,
                                                  "four":4,"five":5,"six":6,"seven":7,"eight":8,"nine":9]
    // 문자요소들을 저장하는 stringNumber와 완성된 단어의 숫자를 저장해주는 stringNumbersArray
    var stringNumber = ""
    var stringNumbersArray: [String] = []
    // s의 문자열을 characters에 할당
    let characters = s.compactMap { character in String(character) }
    
    for i in 0..<characters.count {
        //characters의 요소가 숫자일 경우에 값 저장
        if let number = Int(characters[i]) {
            stringNumbersArray.append(String(number))
        } else {
        //stringNumbersDictionary 여기에 대응 되는게 없으면 누적
            stringNumber += characters[i]
        }
        //stringNumbersDictionary 여기에 대응되는 값이 있으면 변경 == replace
        if let stringValue = stringNumbersDictionary[stringNumber] {
            stringNumbersArray.append(String(stringValue))
            stringNumber = ""
        }
    }
    // stringNumbersArray의 문자열타입인 숫자들을 stringNumber에 누적
    stringNumbersArray.forEach({ number in stringNumber += number })
    // Int로 형변환하여 값을 return
    guard let result = Int(stringNumber) else { return 0 }
    
    return result
}

let testStringNumber = "one4seveneight"
print(solution(testStringNumber))//1478

let testStringNumber2 = "23four5six7"
print(solution(testStringNumber2))//234567

let testStringNumber3 = "2three45sixseven"
print(solution(testStringNumber3))//234567

let testStringNumber4 = "123"
print(solution(testStringNumber4))//123


// MARK: 로직 설명 및 발생한 문제들

"""
1. 문자열을 문자하나하나를 배열로 분리 -> 문자열과 숫자를 분리하기 위한 초기작업
2. 숫자가 나오기전까지 하나하나의 문자를 더하면 단어가 완성됨 ex) [o, n, e, 1] -> [one, 1]

* 여기서 잠깐!
# 문제발생)
A. 만약에 seven1eight 두단어가 연속적으로 존재할땐 단어를 지나쳐버림
=>숫자로 형변환이 기준이되는게아니라. 단어가 하나라도 완성이되면 작업을 진행해는 조건을 넣어야할것같음

B. string 문자열로 값을 저장하면 딕셔너리를 통해 one을 1로 추출한걸 다시 저장하려면 순서가 있지않는한
   원하는 순서대로 배치하기가 어려워 값을 새로운 배열을 생성하여 저장한다.

C. 어려웠던점)
- 단어를 저장하는 변수가 단어가 완성되면(딕셔너리에 key값인 단어와 일치할때 배열에) 숫자를 저장한다. 그리고 그안에서 추가조건으로
  숫자가 형변환이 되면 숫자를 추가로 배열에 저장하는 조건을 넣었고 그냥 마지막 else 에는 알파벳문자값을 넣는 로직을 구현했다.
  이 상태에서 출력을했을때 발생하는 문제가 단어를 저장하기전에 계산을해버린다는 점이다.
  문자 e를 누적해야하는데 seven을 숫자로 바꿔버리니 e는 증발해버리는 로직이었다. 그래서 순서를 변경해주었다.
"""

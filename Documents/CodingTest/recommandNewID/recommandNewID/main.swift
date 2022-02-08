//  main.swift
//  recommandNewID
//  Created by LIMGAUI on 2022/01/17.

import Foundation

"""
카카오 서비스에 가입하는 유저들의 아이디를 생성하는 업무를 담당하는데 규칙이 존재한다.

# 아이디 규칙
- 길이는 3자이상 15자이하
- 아이디는 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 문자만 사용할 수 있다.
- 단, 마침표(.) 는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없다.

네오는 다음과 같은 7단계의 순차적인 처리 과정을 통해 신규 유저가 입력한 아이디가 카카오 아이디 규칙에 맞는지 검사하고 규칙에 맞지 않은 경우 규칙에 맞는 새로운 아이디를 추천해주려 한다. 신규 유저가 입력한 아이디가 new_id라고 한다면

1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
"""

func solution(_ newId: String) -> String {
    // 아이디 규칙
    guard 3 <= newId.count && newId.count <= 15 else { return "" }
    // 1단계
    var verificationId = ""
    var result = ""
    // 2단계
    newId.forEach { character in
        if String(character) == character.lowercased() {
            verificationId += String(character)
        }
        if let _ = Int(String(character)) {
            verificationId += String(character)
        }
        if String(character) == "-" || String(character) == "_" || String(character) == "." {
            verificationId += String(character)
        }
    }
    // 3단계
    var confirmedId = verificationId.components(separatedBy: ["!","@","#","*"]).joined().replacingOccurrences(of: "...", with: ".").replacingOccurrences(of: "..", with: ".")
    // 4단계
    if let firstCharacter = confirmedId.first, firstCharacter == "." {
        confirmedId.removeFirst()
    }
    if let lastCharacter = confirmedId.first, lastCharacter == "." {
        confirmedId.removeLast()
    }
    // 5단계
    if confirmedId.isEmpty { confirmedId += "a" }
    // 6단계
    if confirmedId.count >= 16 {
        var counter = 0
        confirmedId.forEach { character in
            if counter < 15 { result += String(character) }
            counter += 1
        }
    }
    // 7단계
    if result.count <= 2 {
        while result.count < 3 {
            guard let lastCharacter = result.last else { return "" }
            result += String(lastCharacter)
        }
        return result
    } else {
        return result
    }
}
let newId = "z-+.^."
print(solution(newId))

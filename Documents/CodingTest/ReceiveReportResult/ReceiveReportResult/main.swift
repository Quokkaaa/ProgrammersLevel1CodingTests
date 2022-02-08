//  main.swift
//  ReceiveReportResult
//  Created by LIMGAUI on 2022/01/20

import Foundation
 
let idList = ["muzi",
              "frodo",
              "apeach",
              "neo"]
let reportsInfo = ["muzi frodo",
                   "apeach frodo",
                   "frodo neo",
                   "muzi neo",
                   "apeach muzi"]
let kk = 2

func solution(_ id_list: [String], _ reports: [String], _ k: Int) -> [Int] {
    var result = [String: Int]()
    var willFireUser = [String]()
    // k회 이상 신고된 이름 추출
    for id in id_list {
        let receivedReport = reports.indices.filter { reports[$0].components(separatedBy: "  ")[1] == id }
        if receivedReport.count >= k { willFireUser.append(id) }
    }
    // 몇명을 정지 시켰는지 추출 후 return
    for id in id_list {
        reports.forEach { report in
            let reporter = report.components(separatedBy: " ")[0]
            let receiver = report.components(separatedBy: " ")[1]
            if reporter == id, willFireUser.contains(receiver) {
                result.updateValue(+1, forKey: id)
            }
        }
    }
    let finalValues = result.values.map { Int($0) }
    return finalValues
}
print(solution(idList, reportsInfo, kk))

"""
입출력 예
id_list - ["muzi", "frodo", "apeach", "neo"]
report  - ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
k       -  2
result  - [2,1,1,0]

id_list - ["con", "ryan"]
report  - ["ryan con", "ryan con", "ryan con", "ryan con"]
k       -  3
result  - [0,0]

- A가 B를 여러번 신고해도 한번만 신고한걸로 계산됨
- id_list에서 존재하는 아이디와 report의 id값도 같아야함
- report에서 유저와 신고할 유저의 ID는 스페이스바로 구분한다.
- id_list과 report의 정보와 일치해야함(다른유저가 있으면 안됨)
"""

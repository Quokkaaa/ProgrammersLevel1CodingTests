//  main.swift
//  RemoveSmallestNumber
//  Created by LIMGAUI on 2022/02/08.

import Foundation

//func solution(_ arr: [Int]) -> [Int] {
//    var array = arr
//    if arr.count == 1 {
//        array[0] = -1
//        return array
//    } else {
//        guard let smallestNumber = array.min() else { return [0] }
//        array.remove(at: smallestNumber)
//        return array
//    }
//}
let arr = [4,3,2,1]
// Me
// 두 수를 비교하는데 큰수가 나올때마다 그보다 작았던 수를 계속 저장하는 로직이다.
func solution(_ arr: [Int]) -> [Int] {
    if arr.count == 1 { return [-1] }
    // 작은수 담기 or 작은수 인덱스 담기
    var numbers = arr
    var smallestNumber = numbers[0]
    // 반복문을 통한 큰 수 나올때마다 작은 수를 저장하는 로직
    for index in numbers.indices {
        if smallestNumber > numbers[index] { smallestNumber = numbers[index] }
    }
    guard let index = numbers.firstIndex(of: smallestNumber) else { return [0] }
    numbers.remove(at: index)
    return numbers
}
print(solution(arr))

// Another
func solution2(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
     return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
}


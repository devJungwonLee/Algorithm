import Foundation

func recursive(_ array: [String], _ start: Int, _ end: Int) -> Bool {
    let n = end - start + 1
    if (n - 1) % 2 != 0 { return false }
    if n == 1 { return true }
    let mid = (start + end ) / 2
    if array[mid] == "0" { 
        let temp = array[start...end].filter { $0 != "0" }
        if temp.isEmpty { return true }
        return false
    }
    let left = recursive(array, start, mid - 1)
    if !left { return false }
    let right = recursive(array, mid + 1, end)
    if !right { return false }
    return true
}

func canExpress(_ number: Int64) -> Int {
    var numberString = String(number, radix: 2)
    var x = 1
    while numberString.count > x { x = 2 * x + 1 }
    while numberString.count < x { numberString = "0" + numberString }
    let array = numberString.map { String($0) }
    return recursive(array, 0, array.count - 1) ? 1 : 0
}

func solution(_ numbers:[Int64]) -> [Int] {
    return numbers.map { canExpress($0) }
}
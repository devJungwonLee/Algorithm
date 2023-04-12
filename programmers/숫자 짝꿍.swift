import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xCount = [Int](repeating: 0, count: 10)
    var yCount = [Int](repeating: 0, count: 10)
    X.map { Int(String($0))! }.forEach { xCount[$0] += 1 }
    Y.map { Int(String($0))! }.forEach { yCount[$0] += 1 }
    var result = ""
    for i in 0...9 {
        let j = 9 - i
        let cnt = min(xCount[j], yCount[j])
        if cnt == 0 { continue }
        if j == 0, result.isEmpty { return "0" }
        for k in 0..<cnt { result += String(j) }
    }
    if result.isEmpty { result = "-1" }
    return result
}
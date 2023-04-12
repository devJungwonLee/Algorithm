import Foundation

func solution(_ s:String) -> [Int] {
    var pos = [String: Int]()
    var result = [Int]()
    var s = s.map { String($0) }
    for i in 0..<s.count {
        let c = s[i]
        if let p = pos[c] { result.append(i-p) }
        else { result.append(-1) }
        pos[c] = i
    }
    return result
}
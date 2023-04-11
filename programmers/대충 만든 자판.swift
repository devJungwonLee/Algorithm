import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var cnts = [String: Int]()
    for s in keymap {
        for (idx, c) in s.enumerated() {
            if let cnt = cnts[String(c)] {
                if idx + 1 < cnt { cnts[String(c)] = idx + 1 }
            } else {
                cnts[String(c)] = idx + 1
            }
        }
    }
    var result = [Int]()
    for target in targets {
        var sum = 0
        for c in target {
            if let cnt = cnts[String(c)] {
                sum += cnt
            } else {
                sum = -1
                break
            }
        }
        result.append(sum)
    }
    return result
}
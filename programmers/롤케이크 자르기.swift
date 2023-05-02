import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0

    var combs = [
        [Int: Int](), [Int: Int]()
    ]

    for t in topping {
        if let c = combs[1][t] {
            combs[1][t] = c + 1
        } else {
            combs[1][t] = 1
        }
    }

    for t in topping {
        guard let c1 = combs[1][t] else { continue }
        if c1 == 1 { 
            combs[1][t] = nil
        } else { 
            combs[1][t] = c1 - 1
        }
        if let c2 = combs[0][t] {
            combs[0][t] = c2 + 1
        } else {
            combs[0][t] = 1
        }
        if combs[0].keys.count == combs[1].keys.count {
            answer += 1
        }
    }
    return answer
}
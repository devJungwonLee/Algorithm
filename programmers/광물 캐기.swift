import Foundation

var m = [Int]()
var n = 0
var pirodo = [[1, 1, 1], [5, 1, 1], [25, 5, 1]]
var answer = Int.max

func toInteger(_ minerals: [String]) -> [Int] {
    return minerals.map {
        if $0 == "diamond" { return 0 }
        else if $0 == "iron" { return 1 }
        else { return 2 }
    }
}

func recursive(_ picks: [Int], _ order: [Int]) {
    if picks == [0, 0, 0] || order.count * 5 >= n {
        var sum = 0
        let end = order.count * 5 >= n ? n : order.count * 5
        for i in 0..<end {
            let tool = order[i / 5]
            let material = m[i]
            sum += pirodo[tool][material]
        }
        answer = min(answer, sum)
        return
    }
    if picks[0] >= 1 {
        let newPicks = [picks[0] - 1, picks[1], picks[2]]
        let newOrder = order + [0]
        recursive(newPicks, newOrder)
    }
    if picks[1] >= 1 {
        let newPicks = [picks[0], picks[1] - 1, picks[2]]
        let newOrder = order + [1]
        recursive(newPicks, newOrder)
    }
    if picks[2] >= 1 {
        let newPicks = [picks[0], picks[1], picks[2] - 1]
        let newOrder = order + [2]
        recursive(newPicks, newOrder)
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    m = toInteger(minerals)
    n = minerals.count
    recursive(picks, [])
    return answer
}
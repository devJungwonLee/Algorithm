import Foundation

var maxValue = -1000
var maxRyan = [Int]()

func calculateDifference(_ info: [Int], _ ryan: [Int]) -> Int {
    var ryanPoint = 0
    var apeachPoint = 0
    for i in 0...10 {
        if ryan[i] > info[i] { ryanPoint += (10 - i) }
        else if ryan[i] < info[i] { apeachPoint += (10 - i) }
    }
    return ryanPoint - apeachPoint
}

func shouldUpdate(_ diff: Int, _ ryan: [Int]) -> Bool {
    if diff < maxValue { return false }
    if diff > maxValue { return true }
    for i in 0...10 {
        if ryan[10 - i] > maxRyan[10 - i] { return true }
        if ryan[10 - i] < maxRyan[10 - i] { return false }
    }
    return false
}

func recursive(_ point: Int, _ info: [Int], _ arrow: Int, _ ryan: [Int]) {
    if point == -1 {
        if arrow > 0 { return }
        let diff = calculateDifference(info, ryan)
        if diff > 0, shouldUpdate(diff, ryan) {
            maxValue = diff
            maxRyan = ryan
        }
        return
    }
    if arrow > info[10 - point] {
        let newArrow = arrow - (info[10 - point] + 1)
        recursive(point - 1, info, newArrow, ryan + [info[10 - point] + 1])
    }
    if point == 0 { recursive(point - 1, info, 0, ryan + [arrow]) }
    else { recursive(point - 1, info, arrow, ryan + [0]) }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    recursive(10, info, n, [])
    if maxRyan.isEmpty { return [-1] }
    else { return maxRyan }
}
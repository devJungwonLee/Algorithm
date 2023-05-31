import Foundation

var d = [Int: [Int]]()

func find(_ point: Int) -> [Int] {
    if d.keys.contains(point) { return d[point]! }
    if (1...20) ~= point || point == 50 {
        d[point] = [1, 1]
        return d[point]!
    }
    if point % 2 == 0 && (1...20) ~= point / 2 {
        d[point] = [1, 0]
        return d[point]!
    }
    if point % 3 == 0 && (1...20) ~= point / 3 {
        d[point] = [1, 0]
        return d[point]!
    }
    if point > 310 {
        let resultX = find(60)
        let resultY = find(point - 60)
        let result = [resultX[0] + resultY[0], resultX[1] + resultY[1]]
        d[point] = result
        return d[point]!
    }
    var temp = [[Int]]()
    for x in 1..<point {
        let y = point - x
        let resultX = find(x)
        let resultY = find(y)
        let result = [resultX[0] + resultY[0], resultX[1] + resultY[1]]
        temp.append(result)
    }
    let maxValue = temp.max { 
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] > $1[0]
    }!
    d[point] = maxValue
    return d[point]!
}

func solution(_ target:Int) -> [Int] {
    return find(target)
}
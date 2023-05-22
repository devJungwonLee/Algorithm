import Foundation

func distance(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
}

func shortest(_ startX: Int, _ startY: Int, _ m: Int, _ n: Int, _ ball: [Int]) -> Int {
    var distances = [Int]()
    var x = [startX, 2 * m - startX, startX, -startX]
    var y = [2 * n - startY, startY, -startY, startY]
    
    for i in 0..<4 {
        var minValue = min(x[i], startX)
        var maxValue = max(x[i], startX)
        if y[i] == ball[1] && (minValue...maxValue ~= ball[0]) { continue }
        minValue = min(y[i], startY)
        maxValue = max(y[i], startY)
        if x[i] == ball[0] && (minValue...maxValue ~= ball[1]) { continue }
        distances.append(distance(x[i], y[i], ball[0], ball[1]))
    }
    return distances.min()!
}

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    return balls.map { shortest(startX, startY, m, n, $0) }
}
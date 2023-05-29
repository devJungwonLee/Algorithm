import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    let diff = [r - x, c - y]
    let cnt = abs(diff[0]) + abs(diff[1])
    if k < cnt || (k - cnt) % 2 != 0 { return "impossible" }
    var routes = ["d": 0, "l": 0, "r": 0, "u": 0]
    var dir = diff[0] > 0 ? "d" : "u"
    routes[dir] = abs(diff[0])
    dir = diff[1] > 0 ? "r" : "l"
    routes[dir] = abs(diff[1])
    var remain = [n - x, y - 1]
    if diff[0] > 0 { remain[0] -= diff[0] }
    if diff[1] < 0 { remain[1] += diff[1] }
    var q = (k - cnt) / 2
    var minValue = min(q, remain[0])
    if q >= minValue {
        q -= minValue
        routes["d"] = routes["d"]! + minValue
        routes["u"] = routes["u"]! + minValue
    }
    minValue = min(q, remain[1])
    if q >= minValue {
        q -= minValue
        routes["l"] = routes["l"]! + minValue
        routes["r"] = routes["r"]! + minValue
    }
    if q > 0 {
        if min(y, c) < m {
            routes["l"] = routes["l"]! + q
            routes["r"] = routes["r"]! + q
        } else {
            routes["d"] = routes["d"]! + q
            routes["u"] = routes["u"]! + q
        }
        q = 0
    }
    var current = [x, y]
    var t = k
    var answer = ""
    while t > 0 {
        if routes["d"]! > 0 && current[0] < n {
            current[0] += 1
            routes["d"] = routes["d"]! - 1
            answer += "d"
        } else if routes["l"]! > 0 && current[1] > 1 {
            current[1] -= 1
            routes["l"] = routes["l"]! - 1
            answer += "l"
        } else if routes["r"]! > 0 && current[1] < m {
            current[1] += 1
            routes["r"] = routes["r"]! - 1
            answer += "r"
        } else if routes["u"]! > 0 && current[0] > 1 {
            current[0] -= 1
            routes["u"] = routes["u"]! - 1
            answer += "u"
        }
        t -= 1
    }
    return answer
}
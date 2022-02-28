import Foundation

func findStart(_ str: String) -> Float {
    let s = str.components(separatedBy: ":")
    let hour = Float(s[0])!
    let minute = Float(s[1])!
    let second = Float(s[2])!
    return hour * 3600 + minute * 60 + second;
}

func findDuration(_ str: String) -> Float {
    var s = str
    s.removeLast()
    return Float(s)!
}

func find(_ start: Float, _ end: Float, _ a: [(Float, Float)]) -> Int {
    var cnt = 0
    for i in 0..<a.count {
        if a[i].1 < start || a[i].0 >= end { continue }
        cnt += 1
    }
    return cnt
}

func solution(_ lines:[String]) -> Int {
    var a = [(Float, Float)]()
    var answer = 0
    for line in lines {
        let s = line.components(separatedBy: " ")
        let end = findStart(s[1])
        let duration = findDuration(s[2])
        let start = end - duration + 0.001
        a.append((start, end))
    }
    for i in 0..<a.count {
        answer = max(answer, find(a[i].0, a[i].0 + 1, a), find(a[i].1, a[i].1 + 1, a))
    }
    return answer
}
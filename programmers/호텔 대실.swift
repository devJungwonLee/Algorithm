import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var times = [[Int]]()
    
    for b in book_time {
        var s = b[0].components(separatedBy: ":").map { Int($0)! }
        let start = s[0] * 60 + s[1]
        s = b[1].components(separatedBy: ":").map { Int($0)! }
        let end = s[0] * 60 + s[1]
        times.append([start, 1])
        times.append([end + 10, 0])
    }
    
    var cnt = 0
    var answer = 1
    times.sort {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    
    for time in times {
        if time[1] == 0 { cnt -= 1 }
        else if time[1] == 1 { cnt += 1 }
        answer = max(answer, cnt)
    }
    
    return answer
}
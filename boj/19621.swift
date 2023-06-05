struct Meeting {
    let start: Int
    let end: Int
    let people: Int
}

var meetings = [Meeting]()
var d = [[Int]: Int]()
let n = Int(readLine()!)!

func findMax(_ time: Int, _ index: Int) -> Int {
    if index == n { return 0 }
    if d.keys.contains([time, index]) {
        return d[[time, index]]!
    }
    let meeting = meetings[index]
    var maxValue = 0
    var result = findMax(time, index + 1)
    maxValue = max(maxValue, result)
    if meeting.start >= time {
        result = findMax(meeting.end, index + 1)
        maxValue = max(maxValue, result + meeting.people)
    }
    d[[time, index]] = maxValue
    return d[[time, index]]!
} 

for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append(
        Meeting(
            start: s[0],
            end: s[1],
            people: s[2]
        )
    )
}

meetings.sort { $0.start < $1.start }
print(findMax(0, 0))
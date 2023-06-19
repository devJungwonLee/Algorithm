struct Combination: Hashable {
    var time: Int
    var pills: [Bool]
}

let n = Int(readLine()!)!
var pills = (0..<(3 * n)).map { ($0 % 3) % 2 == 0 }
var memo: [Combination: Int] = [:]

func recursive(_ time: Int, _ pills: [Bool]) -> Int {
    if pills.count == 1 {
        if (time % 2 == 0) == pills[0] { return 1 }
        else { return 0 }
    } else if let result = memo[Combination(time: time, pills: pills)] {
        return result
    }
    let flag = time % 2 == 0
    let front = pills[0]
    let back = pills[pills.count - 1]
    var sum = 0
    if flag == front {
        sum += recursive((time + 1) % 3, Array(pills[1..<pills.count]))
    }
    if flag == back {
        sum += recursive((time + 1) % 3, Array(pills[0..<(pills.count - 1)]))
    }
    memo[Combination(time: time, pills: pills)] = sum
    return sum
}

print(recursive(0, pills))
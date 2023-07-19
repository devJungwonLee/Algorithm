var d = [[Int]: Int]()
let t = readLine()!.split(separator: ":").map { Int($0)! }
let second = t[0] * 60 + t[1]

func f(_ time: Int, _ state: Int) -> Int {
    if let result = d[[time, state]] { return result }
    if time == second {
        if state == 1 { return 0 }
        else {
            let result = 1 + f(time, 1 - state)
            d[[time, state]] = result
            return result
        }
    }
    var result = 1000
    if time + 10 <= second { result = min(result, f(time + 10, state)) }
    if time + 60 <= second { result = min(result, f(time + 60, state)) }
    if time + 600 <= second { result = min(result, f(time + 600, state)) }
    if state == 0 {
        if time == 0 { result = min(result, f(time + 30, 1 - state)) }
        else { result = min(result, f(time, 1 - state)) }
    }
    result += 1
    d[[time, state]] = result
    return result
}

let answer = f(0, 0)
print(answer)
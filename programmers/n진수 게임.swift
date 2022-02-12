func f(_ n:Int, _ num: Int) -> String {
    let alphabet = [10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]
    var result = ""
    var num = num
    if num == 0 { return "0" }
    while num > 0 {
        let r = num % n
        if r >= 10 { result = alphabet[r]! + result }
        else { result = String(r) + result }
        num /= n
    }
    return result
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var str = ""
    var answer = ""
    var num = 0
    var cnt = 0
    var turn = 1
    while cnt < t {
        str = f(n, num)
        for c in str {
            if turn == p && cnt < t {
                answer += String(c)
                cnt += 1
                if cnt == t { break }
            }
            turn = turn % m + 1
        }
        num += 1
    }
    return answer
}
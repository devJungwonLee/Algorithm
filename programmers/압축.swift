func solution(_ msg:String) -> [Int] {
    var answer = [Int]()
    var newIndex = 1
    var indices = [String: Int]()
    for c in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        indices[String(c)] = newIndex
        newIndex += 1
    }
    var msg = msg.map { String($0) }
    while !msg.isEmpty {
        var str = ""
        var first = msg.first!
        while indices.keys.contains(str + first) {
            str += first
            msg.removeFirst()
            if msg.isEmpty { break }
            first = msg.first!
        }
        answer.append(indices[str]!)
        if !msg.isEmpty { 
            indices[str + first] = newIndex
            newIndex += 1
        }
    }
    return answer
}
import Foundation

let love = ["L", "O", "V", "E"]
var teams = [String]()
let name = readLine()!
let loveCount = love.map { c in
    return name.map { String($0) }.filter { $0 == c }.count
}
let n = Int(readLine()!)!
for _ in 0..<n { teams.append(readLine()!) }

func probability(of team: String) -> Int {
    var teamCount = love.map { c in
        return team.map { String($0) }.filter { $0 == c}.count
    }
    teamCount = (0..<teamCount.count).map { loveCount[$0] + teamCount[$0] }
    var result = 1
    for i in 0..<teamCount.count {
        for j in i+1..<teamCount.count {
            result = result * (teamCount[i] + teamCount[j]) % 100
        }
    }
    return result
}

let answer = teams.max { lhs, rhs in
    let pl = probability(of: lhs)
    let pr = probability(of: rhs)
    if pl == pr { return lhs > rhs }
    else { return pl < pr }
}!
print(answer)
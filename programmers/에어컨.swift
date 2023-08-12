import Foundation

func solution(_ temperature:Int, _ t1:Int, _ t2:Int, _ a:Int, _ b:Int, _ onboard:[Int]) -> Int {
    var d = [[Int: Int]](repeating: [:], count: onboard.count)
    d[0][temperature] = 0
    for i in 0..<(onboard.count - 1) {
        for (temp, power) in d[i] {
            var cost = temp == temperature ? 0 : b
            var flag = onboard[i+1] == 0 || (t1...t2) ~= temp
            if flag { d[i+1][temp] = min(d[i+1][temp] ?? Int.max, power + cost) }
            
            cost = temp > temperature ? 0 : a
            flag = onboard[i+1] == 0 || (t1...t2) ~= temp - 1
            if flag { d[i+1][temp-1] = min(d[i+1][temp-1] ?? Int.max, power + cost) }
            
            cost = temp < temperature ? 0 : a
            flag = onboard[i+1] == 0 || (t1...t2) ~= temp + 1
            if flag { d[i+1][temp+1] = min(d[i+1][temp+1] ?? Int.max, power + cost) }
        }
    }
    let answer = d[onboard.count - 1].values.min()!
    return answer
}
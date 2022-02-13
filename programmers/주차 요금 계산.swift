import Foundation

func parse(_ record: String) -> (String, Int, Bool) {
    let str = record.components(separatedBy: " ")
    let t = str[0].components(separatedBy: ":")
    let car = str[1]
    let flag = str[2] == "IN" ? true : false
    let time = Int(t[0])! * 60 + Int(t[1])!
    return (car, time, flag)
}

func calculateTime(_ t: [(Int, Bool)]) -> Int {
    var duration = 0
    var sum = 0
    for (time, flag) in t {
        if flag { duration = (-1) * time }
        else { 
            duration += time
            sum += duration
        }
    }
    if duration <= 0 {
        duration += 1439
        sum += duration
    }
    return sum
}

func calculateFee(_ time: Int, _ fees: [Int]) -> Int {
    var result = fees[1]
    let overTime = time - fees[0]
    if overTime > 0 {
        var overFee = 0
        overFee = overTime / fees[2]
        if overTime % fees[2] != 0 { overFee += 1 }
        overFee = overFee * fees[3]
        result += overFee
    }
    return result
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var times = [String: [(Int, Bool)]]()
    var answer = [(String, Int)]()
    for record in records {
        let (car, time, flag) = parse(record)
        if let tmp = times[car] {
            times[car] = tmp + [(time, flag)]
        } else { times[car] = [(time, flag)] }
    }
    for (car, t) in times {
        let sum = calculateTime(t)
        let fee = calculateFee(sum, fees)
        answer.append((car, fee))
    }
    return answer.sorted { $0.0 < $1.0 }.map { $0.1}
}
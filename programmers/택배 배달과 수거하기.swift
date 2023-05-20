import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = deliveries
    var pickups = pickups
    
    var i = n - 1
    while i >= 0, deliveries[i] == 0 { i -= 1 }
    var pd = [Int]()
    if i >= 0 { pd.append(i + 1) }
    
    var sum = 0
    while i >= 0 {
        sum += deliveries[i]
        if sum > cap {
            deliveries[i] = sum - cap
            pd.append(i + 1)
            sum = 0
        } else {
            i -= 1
        }
    }
    
    i = n - 1
    while i >= 0, pickups[i] == 0 { i -= 1 }
    var pp = [Int]()
    if i >= 0 { pp.append(i + 1) }
    
    sum = 0
    while i >= 0 {
        sum += pickups[i]
        if sum > cap {
            pickups[i] = sum - cap
            pp.append(i + 1)
            sum = 0
        } else {
            i -= 1
        }
    }
    
    i = 0
    var answer: Int64 = 0
    while i < pd.count && i < pp.count {
        answer += Int64(max(pd[i], pp[i])) * 2
        i += 1
    }
    if i == pd.count {
        while i < pp.count {
            answer += Int64(pp[i]) * 2
            i += 1
        }
    } else {
        while i < pd.count {
            answer += Int64(pd[i]) * 2
            i += 1
        }
    }
    
    return answer
}
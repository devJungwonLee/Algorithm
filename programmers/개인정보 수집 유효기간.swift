import Foundation

func toIntTime(_ str: String) -> Int {
    let array = str.components(separatedBy: ".").map { Int($0)! }
    let year = array[0] - 2000
    let month = array[1]
    let day = array[2]
    return year * 28 * 12 + (month - 1) * 28 + day
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var duration = [String: Int]()
    let t = toIntTime(today)
    terms.forEach { 
        let s = $0.components(separatedBy: " ")
        duration[s[0]] = Int(s[1])!
    }
    return (0..<privacies.count).filter { 
        let s = privacies[$0].components(separatedBy: " ")
        let date = toIntTime(s[0])
        let d = duration[s[1]]!
        return date + d * 28 <= t
    }.map { $0 + 1 }
}
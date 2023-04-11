import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var i = 0
    var j = 0
    for word in goal {
        if i < cards1.count, cards1[i] == word { i += 1 }
        else if j < cards2.count, cards2[j] == word { j += 1 }
        else { return "No" }
    }
    return "Yes"
}
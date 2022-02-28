import Foundation

var d = [String: [String]]()
var c = Set<Set<String>>()

func check(_ uid: String, _ id: String) -> Bool {
    if uid.count != id.count { return false }
    let uid = uid.map { String($0) }
    let id = id.map { String($0) }
    for i in 0..<id.count {
        if id[i] != "*", id[i] != uid[i] { return false }
    }
    return true
}

func f(_ a: [String], _ s: Set<String>) {
    if a.isEmpty {
        c.insert(s)
        return
    }
    
    var a = a
    var s = s
    let id = a.removeFirst()
    for uid in d[id]! {
        if s.contains(uid) { continue }
        s.insert(uid)
        f(a, s)
        s.remove(uid)
    }
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    for id in banned_id {
        if d.keys.contains(id) { continue }
        var a = [String]()
        for uid in user_id {
            if check(uid, id) { a.append(uid) }
        }
        d[id] = a
    }
    f(banned_id, Set<String>())
    return c.count
}
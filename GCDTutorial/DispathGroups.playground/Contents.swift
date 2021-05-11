import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "DispatchGroups", attributes: .concurrent)
let group = DispatchGroup()

queue.async(group: group) {
    for i in 0...10 {
        if i == 10 {
            print(i)
        }
    }
}

group.notify(queue: .main) {
    print("Notification: completion in group")
}

let secondGroup = DispatchGroup()
secondGroup.enter()
queue.async(group: group) {
    for i in 0...30 {
        if i == 30 {
            print(i)
            secondGroup.leave()
        }
    }
}

let result = secondGroup.wait(timeout: .now() + .milliseconds(600))
print(result)

secondGroup.notify(queue: .main) {
    print("Notification: completion in secondGroup")
}

print(#line, "Probe line")

secondGroup.wait() // Waiting secondGroup for completion before executing further code

print(#line, "Probe line")

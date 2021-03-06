import UIKit

//Implementation of Queue data structure in swift

struct Queue<T> {
    var head = -1
    var tail = -1
    let capacity: Int
    var items: [T] = []

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    var isFull: Bool {
        return tail == capacity-1
    }
    var isEmpty: Bool {
        return head == -1
    }

    mutating func enque(_ item: T) {
        if isFull {
            print("Queue is Full")
            return
        }
        items.append(item)
        tail += 1
        head = (head == -1) ? 0 : head
    }

    mutating func deque() -> T? {
        if isEmpty {
            print("Queue is Empty")
            return nil
        }
        defer {
            items.removeLast()
            head += 1
            //when queue becomes empty
            if head > tail {
                head = -1
                tail = -1
            }
        }
        return items.last
    }
}

import UIKit

class LinkedListNode<T> {
    var previous: LinkedListNode<T>?
    var next: LinkedListNode<T>?
    var data: T

    init(data: T) {
        self.data = data
    }
}

class DoublyLinkedList<T> {

    typealias Node = LinkedListNode<T>

    private var head: Node?

    //private var tail: Node?
    private var lastNode: Node? {
        guard var currentNode = head else {return nil}
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        return currentNode
    }

    //public var count: Int = 0
    public var count: Int {
        var c = 0
        var current = head
        while current != nil {
            current = current?.next
            c += 1
        }
        return c
    }

    public func addHead(_ data: T) -> Node {
        let node = Node(data: data)
        defer {
            head = node
            count += 1
        }

        guard let head = head else {
            tail = node
            return node
        }

        head.previous = node

        node.previous = nil
        node.next = head

        return node
    }

    public func moveToHead(_ node: Node) {
        guard node !== head else { return }
        let previous = node.previous
        let next = node.next

        previous?.next = next
        next?.previous = previous

        node.next = head
        node.previous = nil

        if node === tail {
            tail = previous
        }

        self.head = node
    }

    public func removeLast() -> Node? {
        guard let tail = self.tail else { return nil }

        let previous = tail.previous
        previous?.next = nil
        self.tail = previous

        if count == 1 {
            head = nil
        }

        count -= 1

        // 1
        return tail
    }
}

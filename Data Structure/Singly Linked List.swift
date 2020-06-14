import Foundation

//Single Linked List

class LinkedListNode<T>: Equatable{
    let data: T
    var next: LinkedListNode?

    init(data: T) {
        self.data = data
    }

    static func == (lhs: LinkedListNode<T>,rhs: LinkedListNode<T>) -> Bool{
        return lhs.next == rhs.next
    }
}

class LinkedList<T> {

    typealias Node = LinkedListNode<T>

    var head: Node?

    var isEmpty: Bool {
        return head == nil
    }

    var lastNode: Node? {
        guard var currentNode = head else {return nil}
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        return currentNode
        //        var node: Node? = head
        //        while node != nil && node!.next != nil {
        //            node = node!.next
        //        }
    }

    public func count() -> Int {
        var c = 0
        var current = head
        while current != nil {
            current = current?.next
            c += 1
        }
        return c
    }

    public func append(value: T) {
        let newNode = Node(data: value)
        if let lastNode = lastNode {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    public func reverse() -> Node? {
        var next: Node? = nil
        var current = head
        var previous: Node? = nil

        while current != nil {
            //store next
            next = current?.next
            //reverse current node's position
            current?.next = previous
            //move pointers to one position ahead
            previous = current
            current = next
        }
        head = previous
        return head
    }

    //intersecting node of two linked list
    public func intersectingNode(_ list1: LinkedList<T>,_ list2: LinkedList<T>) -> Node? {
        let list1Count = list1.count()
        let list2Count = list2.count()
        var diff = 0
        if list1Count > list2Count {
            diff = list1Count - list2Count
        }else {
            diff = list2Count - list1Count
        }

        var current1 = list1.head
        var current2 = list2.head

        for _ in 0...diff {
            current1 = current1?.next
        }

        while  current1 != nil && current2 != nil {
            if current1 == current2 {
                return current1
            }
            current1 = current1?.next
            current2 = current2?.next
        }
        return nil
    }
}

var sampleLinkedList = LinkedList<Int>()
sampleLinkedList.append(value: 45)
sampleLinkedList.append(value: 46)
sampleLinkedList.append(value: 47)
sampleLinkedList.append(value: 48)
sampleLinkedList.append(value: 49)

//Reverse a linked list

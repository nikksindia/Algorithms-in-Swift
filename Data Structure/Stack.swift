import UIKit

// Implementation of STACK data structure in swift

struct Stack<T> {
    var top = -1
    var items: [T] = []
    let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func isEmpty() -> Bool {
        if top == -1 {
            //Underflow
            return true
        }
        return false
    }

    func isFull() -> Bool {
        if top == capacity-1 {
            //Overflow
            return true
        }
        return false
    }

    mutating func push(_ item: T) {
        if isFull() {
            print("Stack is Full")
            return
        }

        items.insert(item, at: 0)
        top += 1
        print("Item insertion success")
    }

    mutating func pop() {
        if isEmpty() {
            print("Stack is Empty")
            return
        }

        items.removeFirst()
        top -= 1
        print("Item removed success")
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Complexities of Stack////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Push Operation : O(1)
//Pop Operation : O(1)
//Top Operation : O(1)
//Search Operation : O(n)



////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Applications of Stack////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//To reverse a word - Put all the letters in a stack and pop them out. Because of LIFO order of stack,
//                    you will get the letters in reverse order.
//In compilers - Compilers use stack to calculate the value of expressions like 2+4/5*(7-9) by converting
//               the expression to prefix or postfix form.
//In browsers - The back button in a browser saves all the urls you have visited previously in a stack.
//              Each time you visit a new page, it is added on top of the stack. When you press the back button,
//              the current URL is removed from the stack and the previous url is accessed.

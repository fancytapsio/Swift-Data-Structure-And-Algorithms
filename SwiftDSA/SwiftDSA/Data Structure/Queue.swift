//
//  Queue.swift
//  SwiftDSA
//
//  Created by Muhammad Hasan on 2016-05-31.
//  Copyright © 2016 Muhammad Hasan. All rights reserved.
//

import Foundation

/**
 Implemetation uses a technique of simulating a queue through
 the use of two stacks (two regular Swift arrays). As elements
 are enqueued, they are pushed into the "right" stack. Then
 when elements are dequeued, they are popped off the "left" stack,
 where they are held in reverse order. When the left stack is empty,
 the right stack is reversed into the left stack.
 */

struct Queue<Element>: QueueType {

    private var left: [Element]
    private var right: [Element]
    
    init() {
        
        left = []
        right = []
    }
    
    /**
     Appends an element to the right stack in O(1)
     */
    mutating func enqueue(element: Element) {
    
        right.append(element)
    }
    
    /**
     Returns nil if the Queue is empty.
     Removes and returns the front element of the Queue in amortized O(1).
     */
    mutating func dequeue()-> Element? {
        guard !(left.isEmpty && right.isEmpty) else { return nil }
        
        if left.isEmpty {
        
            left = right.reverse()
            right.removeAll(keepCapacity: true)
        }
        
        return left.removeLast()
    }
}

/**
 Just by comforming to CollectionType protocol by implementing
 startIndex, endIndex and subscript, we get all the features of
 CollectionType for free.
 */

extension Queue: CollectionType {

    var startIndex: Int { return 0 }
    var endIndex: Int { return left.count + right.count }
    
    subscript(idx: Int) -> Element {
        precondition((0..<endIndex).contains(idx), "index provided is bigger than the total number of elements in the Queue. Index provided is out of bounds")
        
        if idx < left.endIndex {
            /**
             left contains the reverse of enqueued element
             so the index should start counting from back of the
             left array in this case.
             */
            return left[left.count - idx.successor()]
        
        } else {
            /**
             idx refers to an index within all elements in the
             Queue, so right and left should be taken into account
             when counting.
             */
            return right[idx - left.count]
        }
    }
}

/**
 By implementing ArrayLiteralConvertable we can now create
 a Queue by assigning it to Array Literal (i.e. [1,2,3])
 */

extension Queue: ArrayLiteralConvertible {
 
    init(arrayLiteral elements: Element...) {
        self.left = elements.reverse()
        self.right = []
    }
}

extension Queue: RangeReplaceableCollectionType {

    mutating func reserveCapacity(n: Int) { return }
    
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Int>, with newElements: C) {
        
        right = left.reverse() + right
        left.removeAll(keepCapacity: true)
        right.replaceRange(subRange, with: newElements)
    }
}
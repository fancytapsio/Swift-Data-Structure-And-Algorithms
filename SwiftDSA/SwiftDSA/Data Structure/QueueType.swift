//
//  QueueType.swift
//  SwiftDSA
//
//  Created by Muhammad Hasan on 2016-05-31.
//  Copyright © 2016 Muhammad Hasan. All rights reserved.
//

import Foundation

protocol QueueType {
    
    /// type of element held in the queue
    associatedtype Element
    
    /// adds new element to the queue
    mutating func enqueue(newElement: Element)
    
    /// Returns an element in turn removing it from the queue.
    /// Returns nil if the queue is empty
    mutating func dequeue() -> Element?
}
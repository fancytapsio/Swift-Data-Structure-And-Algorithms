//
//  QueueTests.swift
//  SwiftDSA
//
//  Created by Muhammad Hasan on 2016-05-31.
//  Copyright © 2016 Muhammad Hasan. All rights reserved.
//

import XCTest
@testable import SwiftDSA

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_enqueue() {
        
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        XCTAssertEqual(queue.count, 3, "enqueue did not increase the count of the queue")
    }

    func test_dequeue() {
    
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(queue.dequeue(), 1, "dequeue was unable to dequeue element")
        XCTAssertEqual(queue.dequeue(), 2, "dequeue was unable to dequeue element")
        XCTAssertEqual(queue.dequeue(), 3, "dequeue was unable to dequeue element")
    }
    
    func test_subscript() {
    
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(queue[0], 1, "subscript mismatch at index 0")
        XCTAssertEqual(queue[1], 2, "subscript mismatch at index 1")
        XCTAssertEqual(queue[2], 3, "subscript mismatch at index 2")
    }
    
    func test_replaceRange() {
    
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        queue.replaceRange(0..<3, with: [4,5,6])
        
        XCTAssertEqual(queue.count, 3, "queue count mismatch")
        XCTAssertEqual(queue[0], 4, "subscript mismatch at index 0")
        XCTAssertEqual(queue[1], 5, "subscript mismatch at index 1")
        XCTAssertEqual(queue[2], 6, "subscript mismatch at index 2")
    }
}

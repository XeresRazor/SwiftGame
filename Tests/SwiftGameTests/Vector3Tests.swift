//
//  Vector3Tests.swift
//
//
//  Created by David Green on 10/9/20.
//

import XCTest
@testable import SwiftGame

final class Vector3Tests: XCTestCase {
    func testMultiplication() {
        let vector = Vector3(1, 2, 3)

        // Test 0.0 scale
        XCTAssertEqual(Vector3.zero, 0 * vector)
        XCTAssertEqual(Vector3.zero, vector * 0)

        // Test 1.0 scale
        XCTAssertEqual(vector, 1 * vector)
        XCTAssertEqual(vector, vector * 1)

        var scaledVec = Vector3(vector.x * 2, vector.y * 2, vector.z * 2)

        // Test 2.0 scale
        XCTAssertEqual(scaledVec, 2 * vector)
        XCTAssertEqual(scaledVec, vector * 2)
        XCTAssertEqual(vector * 2, scaledVec)

        scaledVec = Vector3(vector.x * 0.999, vector.y * 0.999, vector.z * 0.999)

        // Test 0.999 scale
        XCTAssertEqual(scaledVec, 0.999 * vector)
        XCTAssertEqual(scaledVec, vector * 0.999)
        XCTAssertEqual(vector * 0.999, scaledVec)

        let vector2 = Vector3(2, 2, 2)

        // Test vector multiplication
        XCTAssertEqual(Vector3(vector.x * vector2.x, vector.y * vector2.y, vector.z * vector2.z), vector * vector2)
        XCTAssertEqual(vector2 * vector, Vector3(vector.x * vector2.x, vector.y * vector2.y, vector.z * vector2.z))
        XCTAssertEqual(vector * vector2, vector2 * vector)
    }

    static var allTests = [
        ("testMultiplication", testMultiplication),
    ]
}
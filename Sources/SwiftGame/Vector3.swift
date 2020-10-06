//
//  Vector3.swift
//  
//
//  Created by David Green on 10/5/20.
//

import Foundation

/// Describes a 3D vector

public struct Vector3: Equatable, Codable, CustomDebugStringConvertible {
    // MARK: - Static properties
    /// Returns a `Vector3` with components `0, 0, 0`.
    public static let zero: Vector3 = Vector3(0, 0, 0)

    /// Returns a `Vector3` with components `1, 1, 1`.
    public static let one: Vector3 = Vector3(1, 1, 1)

    /// Returns a `Vector3` with components `1, 0, 0`.
    public static let unitX: Vector3 = Vector3(1, 0, 0)

    /// Returns a `Vector3` with components `0, 1, 0`.
    public static let unitY: Vector3 = Vector3(0, 1, 0)

    /// Returns a `Vector3` with components `0, 0, 1`.
    public static let unitZ: Vector3 = Vector3(0, 0, 1)

    /// Returns a `Vector3` with components `0, 1, 0`.
    public static let up: Vector3 = Vector3(0, 1, 0)

    /// Returns a `Vector3` with components `0, -1, 0`.
    public static let down: Vector3 = Vector3(0, -1, 0)

    /// Returns a `Vector3` with components `0, -1, 0`.
    public static let right: Vector3 = Vector3(0, -1, 0)

    /// Returns a `Vector3` with components `-1, 0, 0`.
    public static let left: Vector3 = Vector3(-1, 0, 0)

    /// Returns a `Vector3` with components `0, 0, -1`.
    public static let forward: Vector3 = Vector3(0, 0, -1)

    /// Returns a `Vector3` with components `0, 0, 1`.
    public static let backward: Vector3 = Vector3(0, 0, 1)

    // MARK: - Public ivars
    /// The *x* coordinate of this `Vector3`.
    public var x: Float
    /// The *y* coordinate of this `Vector3`.
    public var y: Float
    /// The *z* coordinate of this `Vector3`.
    public var z: Float

    // MARK: - CustomDebugStringConvertible
    public var debugDescription: String {
        return "\(x) \(y) \(z)"
    }

    // MARK: - Constructors

    /// Constructs a 3d vector with X, Y, and Z from three values.
    ///
    /// - Parameters:
    ///   - x: The x coordinate in 3d space.
    ///   - y: The y coordinate in 3d space.
    ///   - z: The z coordinate in 3d space.

    public init(_ x: Float, _ y: Float, _ z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }

    /// Constructs a 3D vector with X, Y, and Z set to the same value
    ///
    /// - Parameters:
    ///   - value: The x, y, and z coordinates in 3d space.

    public init(_ value: Float) {
        x = value
        y = value
        z = value
    }

    /// Constructs a 3D vector with X, Y from a `Vector2` and Z from a scalar.
    ///
    /// - Parameters:
    ///   - value: The x and y coordinates in 3d space.
    ///   - z: The z coordinate in 3d space.

    public init(_ value: Vector2, z: Float) {
        x = value.x
        y = value.y
        self.z = z
    }
}

// MARK: - Public methods

public extension Vector3 {

    /// Creates a new `Vector3` that contains the cartesian coordinates of a vector specified in barycentric coordinates and relative to a 3d triangle.
    /// - Parameters:
    ///   - value1: The first vector of a 3d triangle.
    ///   - value2: The second vector of a 3d triangle.
    ///   - value3: The third vector of a 3d triangle.
    ///   - amount1: Barycentric scalar **b2** which represents a weighting factor towards the second vector of the 3d triangle.
    ///   - amount2: Barycentric scalar **b3** which represents a weighting factor towards the third vector of the 3d triangle.
    /// - Returns: The cartesian translation of barycentric coordinates.
    static func barycentric(_ value1: Vector3, _ value2: Vector3, _ value3: Vector3, amount1: Float, amount2: Float) -> Vector3 {
        return Vector3(
            MathHelper.barycentric(value1.x, value2.x, value3.x, amount1: amount1, amount2: amount2),
            MathHelper.barycentric(value1.y, value2.y, value3.y, amount1: amount1, amount2: amount2),
            MathHelper.barycentric(value1.z, value2.z, value3.z, amount1: amount1, amount2: amount2))
    }

    /// Creates a new `Vector3` that contains the cartesian coordinates of a vector specified in barycentric coordinates and relative to a 3d triangle.
    /// - Parameters:
    ///   - value1: The first vector of a 3d triangle.
    ///   - value2: The second vector of a 3d triangle.
    ///   - value3: The third vector of a 3d triangle.
    ///   - amount1: Barycentric scalar **b2** which represents a weighting factor towards the second vector of the 3d triangle.
    ///   - amount2: Barycentric scalar **b3** which represents a weighting factor towards the third vector of the 3d triangle.
    ///   - result: The cartesian translation of barycentric coordinates as an `inout` parameter.
    static func barycentric(_ value1: Vector3, _ value2: Vector3, _ value3: Vector3, amount1: Float, amount2: Float, result: inout Vector3) {
        result.x = MathHelper.barycentric(value1.x, value2.x, value3.x, amount1: amount1, amount2: amount2)
        result.y = MathHelper.barycentric(value1.y, value2.y, value3.y, amount1: amount1, amount2: amount2)
        result.z = MathHelper.barycentric(value1.z, value2.z, value3.z, amount1: amount1, amount2: amount2)
    }
}

// MARK: - Operators

public extension Vector3 {

    /// Inverts the values in the `Vector3`.
    ///
    /// - Parameters:
    ///   - vector: Source `Vector3` on the right of the negative sign.
    ///
    /// - Returns:Result of the inversion.

    @inlinable
    static prefix func - (vector: Vector3) -> Vector3 {
        return Vector3(-vector.x, -vector.y, -vector.z)
    }

    /// Adds two vectors.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the plus sign.
    ///   - right: Source `Vector3` on the right of the plus] sign.
    ///
    /// - Returns:Sum of the vectors.

    @inlinable
    static func + (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }

    /// Subtracts a `Vector3` from a `Vector3`.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the minus sign.
    ///   - right: Source `Vector3` on the right of the minus sign.
    ///
    /// - Returns:Result of the vector subtraction.

    @inlinable
    static func - (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }

    /// Multiplies the components of two `Vector3`s by each other.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the multiplication sign.
    ///   - right: Source `Vector3` on the right of the multiplication sign.
    ///
    /// - Returns:Result of the vector multiplication.

    @inlinable
    static func * (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(left.x * right.x, left.y * right.y, left.z * right.z)
    }

    /// Multiplies the components of a`Vector3` by a scalar.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the multiplication sign.
    ///   - right: Scalar value on the right of the multiplication sign.
    ///
    /// - Returns:Result of the vector multiplication by a scalar.

    @inlinable
    static func * (left: Vector3, right: Float) -> Vector3 {
        return Vector3(left.x * right, left.y * right, left.z * right)
    }

    /// Multiplies the components of a`Vector3` by a scalar.
    ///
    /// - Parameters:
    ///   - left: Scalar value on the left of the multiplication sign.
    ///   - right: Source `Vector3` on the right of the multiplication sign.
    ///
    /// - Returns:Result of the vector multiplication by a scalar.

    @inlinable
    static func * (left: Float, right: Vector3) -> Vector3 {
        return Vector3(left * right.x, left * right.y, left * right.z)
    }

    /// Divides the components of two `Vector3`s by each other.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the division sign.
    ///   - right: Source `Vector3` on the right of the division sign.
    ///
    /// - Returns:Result of the vector division.

    @inlinable
    @inline(__always)
    static func / (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(left.x / right.x, left.y / right.y, left.z / right.z)
    }

    /// Divides the components of a`Vector3` by a scalar.
    ///
    /// - Parameters:
    ///   - left: Source `Vector3` on the left of the division sign.
    ///   - right: Scalar value on the right of the division sign.
    ///
    /// - Returns:Result of the vector division by a scalar.

    @inlinable
    @inline(__always)
    static func / (left: Vector3, right: Float) -> Vector3 {
        let factor = 1.0 / right
        return Vector3(left.x * factor, left.y * factor, left.z * factor)
    }
}

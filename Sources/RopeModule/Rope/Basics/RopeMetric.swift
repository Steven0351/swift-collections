//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Collections open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

public protocol RopeMetric<Element>: Sendable {
  associatedtype Element: RopeElement

  func size(of summary: Element.Summary) -> Int
  func index(at offset: Int, in element: Element) -> Element.Index
}

extension RopeMetric {
  @inlinable @inline(__always)
  internal func _nonnegativeSize(of summary: Element.Summary) -> Int {
    let r = size(of: summary)
    assert(r >= 0)
    return r
  }
}

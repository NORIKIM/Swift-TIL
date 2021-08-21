/// Copyright (c) 2021 Razeware LLC
/// Jina made


import Foundation

final class Box<T> {
  typealias Listener = (T) -> Void

  var listener: Listener?
  var value: T {
    didSet {
      listener?(value)
    }
  }

  init(_ value: T) {
    self.value = value
  }

  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

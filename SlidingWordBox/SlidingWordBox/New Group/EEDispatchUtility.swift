
import UIKit

class EEDispatchUtility {
  private static var associatedObjectKey =
    "EEDispatchUtility.associatedObjectKey"
  
  static func executeOnce(_ queue: DispatchQueue, observer: Any, key: String, execute: @escaping () -> Void) {
    var keyList = objc_getAssociatedObject(observer, &associatedObjectKey) as? [String] ?? []
    if keyList.contains(key) { return }
    keyList.append(key)
    objc_setAssociatedObject(observer, &associatedObjectKey, keyList, .OBJC_ASSOCIATION_RETAIN)
    queue.async(execute: execute)
  }
  
  static func executeOnce(observer: Any, key: String, execute: () -> Void) {
    var keyList = objc_getAssociatedObject(observer, &associatedObjectKey) as? [String] ?? []
    if keyList.contains(key) { return }
    keyList.append(key)
    objc_setAssociatedObject(observer, &associatedObjectKey, keyList, .OBJC_ASSOCIATION_RETAIN)
    execute()
  }
}

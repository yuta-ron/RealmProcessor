#!/usr/bin/env swift

import Foundation
import RealmSwift
print("Swift スクリプト : Start")

let realm = try! Realm()

// 現在日時を JST で表示する
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateFormatter.locale = Locale(identifier: "ja_JP")
print("\(dateFormatter.string(from: Date()))")

print("Swift スクリプト : Finished")
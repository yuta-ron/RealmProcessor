//
//  main.swift
//  RealmProcessor
//
//  Created by yutaron on 2024/02/26.
//

import Foundation
import RealmSwift

print("Hello, World!")


let loc = Location()
// Realmインスタンスの取得
let realm = try! Realm()
do {
    let fm = FileManager.default
    //let curdir = fm.currentDirectoryPath
    let curDir = "/Users/yutaron/ghq/github.com/yuta-ron/RealmProcessor"
    let prefsDir = URL(fileURLWithPath: (curDir as NSString).appendingPathComponent("prefs"))
    // 指定したディレクトリ内のアイテムのURLを取得
    let fileURLs = try fm.contentsOfDirectory(at: prefsDir, includingPropertiesForKeys: nil)
    
    print(fileURLs)
    // .csv拡張子を持つファイルのみをフィルタリング
    let dirs = fileURLs.filter { $0.pathExtension != "zip" }
    // フィルタリングされたCSVファイルのパスを表示
    for dirname in dirs {
        let fileURLs = try fm.contentsOfDirectory(at: dirname, includingPropertiesForKeys: nil)
//        print(fileURL.path)
    }
} catch  {
    print("error: \(error)")
}

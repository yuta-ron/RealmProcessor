//
//  main.swift
//  RealmProcessor
//
//  Created by yutaron on 2024/02/26.
//

import Foundation
import RealmSwift


print(Realm.Configuration.defaultConfiguration.fileURL!)

do {
    let fm = FileManager.default
    //let curdir = fm.currentDirectoryPath
    let curDir = "/Users/yutaron/ghq/github.com/yuta-ron/RealmProcessor"
    let prefsDir = URL(fileURLWithPath: (curDir as NSString).appendingPathComponent("prefs/csv"))
    // 指定したディレクトリ内のアイテムのURLを取得
    let fileURLs = try fm.contentsOfDirectory(at: prefsDir, includingPropertiesForKeys: nil)
//    fileURLs.enumerated().forEach({i, url in
//        print(i, url)
//    })
    for url in fileURLs{
//        print(url.absoluteString)
        importCSV(filePath: url)
    }
} catch  {
    print("error: \(error)")
}


func importCSV(filePath: URL) {
    do {
        let data = try String(contentsOf: filePath, encoding: .shiftJIS)
        let rows = data.components(separatedBy: "\n")
        
        
        let cfg = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: cfg)

        let locmodel = Location()

        print("start")
        // 各行を解析してRealmオブジェクトに変換
        for (i, row) in rows.enumerated() {
            if (i == 0) {
                continue;
            }
            
            let columns = row.components(separatedBy: ",")
            if (columns.count < 8) {
                print(columns)
                continue
            }
            
            locmodel.prefectureCode = Int(columns[0]) ?? -1
            locmodel.prefectureName = columns[1]
            locmodel.cityCode = Int(columns[2]) ?? -1
            locmodel.cityName = columns[3]
            locmodel.blockCode = Int(columns[4]) ?? -1
            locmodel.blockName = columns[5]
            locmodel.longitude = Double(columns[6]) ?? -1
            locmodel.latitude = Double(columns[7]) ?? -1
            try! realm.write {
                realm.add(locmodel)
            }
        }
        print("done")
    } catch {
        print("CSV読み込みエラー: \(error)")
    }
}

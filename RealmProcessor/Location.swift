//
//  Models.swift
//  RealmProcessor
//
//  Created by yutaron on 2024/02/26.
//

import Foundation
import RealmSwift


class Location: Object {
    @objc dynamic var prefectureCode = ""
    @objc dynamic var prefectureName = ""
    @objc dynamic var cityCode = ""
    @objc dynamic var cityName = ""
    @objc dynamic var blockCode = ""
    @objc dynamic var blockName = ""
    @objc dynamic var latitude = ""
    @objc dynamic var longitude = ""
}

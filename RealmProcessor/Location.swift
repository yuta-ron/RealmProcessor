//
//  Models.swift
//  RealmProcessor
//
//  Created by yutaron on 2024/02/26.
//

import Foundation
import RealmSwift


class Location: Object {
    @Persisted var prefectureCode: Int = 0
    @Persisted var prefectureName: String = ""
    @Persisted var cityCode: Int = 0
    @Persisted var cityName: String = ""
    @Persisted var blockCode: Int = 0
    @Persisted var blockName: String = ""
    @Persisted var latitude: Double = 0.0
    @Persisted var longitude: Double = 0.0
}

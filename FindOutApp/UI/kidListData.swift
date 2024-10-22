//
//  kidListData.swift
//  FindOutApp
//
//  Created by cmStudent on 2024/10/22.
//

import Foundation
class kidListData:ObservableObject {
    static var shared = kidListData()
    let id = UUID()
    var findedNumber = 0
    var totalNumber = 1
    var imgSize:CGFloat = 30
}

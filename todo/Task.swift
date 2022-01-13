//
//  Task.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/13.
//

import Foundation
import RealmSwift


class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}

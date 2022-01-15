//
//  TaskRow.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/10.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    var body: some View { 
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: completed ? "checkmark.circle": "circle")
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "烫头", completed: true)
    }
}

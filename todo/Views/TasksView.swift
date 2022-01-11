//
//  TasksView.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/10.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            Text("我的任务")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}

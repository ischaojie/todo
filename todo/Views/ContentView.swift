//
//  ContentView.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/10.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TasksView()
            
            SmallAddButton()
                .padding()
                // 按钮触发 action：tap
                .onTapGesture {
                    // 触发
                    // Boolean 类型可以通过 toggle 来切换 true or false
                    showAddTaskView.toggle()
                }
        }
        // 展示 sheet，绑定了 showAddTaskView
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

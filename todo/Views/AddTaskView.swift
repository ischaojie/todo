//
//  AddTaskView.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/10.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("新建一个任务")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("任务名称", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                print("Task Added!")
            } label: {
                Text("添加任务")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
                    
            }
             
            Spacer()
         
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

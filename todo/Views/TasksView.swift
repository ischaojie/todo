//
//  TasksView.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/10.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("明日复明日，明日何其多。")
                    .padding()
                    .foregroundColor(.gray)
                
                List {
                    ForEach(realmManager.tasks, id: \.id) {
                        task in
                        if !task.isInvalidated {
                            TaskRow(task: task.title, completed: task.completed)
                                // 点击 task 切换 complete
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                                // 滑动的操作
                                .swipeActions(edge: .trailing) {
                                    // 添加删除按钮
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    }label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                        
                    }.listRowSeparator(.hidden)
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
            }
            .navigationTitle(Text("我的一天").font(.title3).bold())
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("Inbox", systemImage: "tray.circle.fill")
                }
            }
            .sheet(isPresented: $showingProfile) {
                    InboxView()
                    .environmentObject(realmManager)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView().environmentObject(RealmManager())
    }
}

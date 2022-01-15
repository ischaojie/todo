//
//  InboxView.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/16.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack() {
            Text("收件箱")
            List() {
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
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView().environmentObject(RealmManager())
    }
}

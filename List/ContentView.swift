//
//  ContentView.swift
//  List
//
//  Created by Zach Eriksen on 9/28/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var object: ListObject
    @State private var isAddingItem: Bool = false
    @State private var isAddingSection: Bool = false
    @State private var isEditingSection: Bool = false
    @State private var selectedSection: ListSection?
    
    var body: some View {
        NavigationView {
            listView
                .navigationBarTitle(Text("List"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isAddingSection.toggle()
                    }, label: {
                        Text("Add Section")
                    })
                        .sheet(isPresented: self.$isAddingSection) {
                            AddSectionView(isPresented: self.$isAddingSection)
                                .environmentObject(self.object)
                    }
                    
            )
        }
    }
    
    var listView: some View {
        VStack {
            List {
                ForEach(object.sections) { section in
                    Section(header: self.listHeaderView(forSection: section)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination:
                                ItemDetailView(section: section, item: item)
                                    .environmentObject(self.object)
                            ) {
                                ListItemView(item: item)
                            }
                        }
                    }
                }
            }
            Text("")
                .hidden()
                .sheet(isPresented: self.$isAddingItem) {
                    AddingItemView(isPresented: self.$isAddingItem, section: self.$selectedSection)
                        .environmentObject(self.object)
            }
            Text("")
                .hidden()
                .sheet(isPresented: self.$isEditingSection) {
                    EditSectionView(isPresented: self.$isEditingSection, section: self.$selectedSection)
                        .environmentObject(self.object)
            }
        }
    }
    
    func listHeaderView(forSection section: ListSection) -> some View {
        HStack {
            Text(section.header)
            Button(action: {
                self.selectedSection = section
                self.isEditingSection.toggle()
            }, label: {
                Image(systemName: "pencil")
            })
            Spacer()
            
            Button(action: {
                self.selectedSection = section
                self.isAddingItem.toggle()
            }, label: {
                Image(systemName: "plus")
            })
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

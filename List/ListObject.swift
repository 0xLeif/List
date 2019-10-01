//
//  ListObject.swift
//  List
//
//  Created by Zach Eriksen on 9/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

class ListObject: ObservableObject {
    @Published var sections: [ListSection]
    
    init() {
        self.sections = []
    }
    
    init(sections: [ListSection]) {
        self.sections = sections
    }
}

struct ListSection: Identifiable {
    var id = UUID()
    var header: String
    var items: [ListItem]
}

struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}


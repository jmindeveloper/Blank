//
//  ContentView.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI
import PDFKit

let dummyPDF: [PDF] = [
    PDF(url: "", name: "test PDF -sdlkjfl", createAt: Date(), editAt: Date()),
    PDF(url: "", name: "test PDF -as;djfshd", createAt: Date(), editAt: Date()),
    PDF(url: "", name: "test PDF -as;i;lkjsdk", createAt: Date(), editAt: Date()),
    PDF(url: "", name: "test PDF -409u2[09j", createAt: Date(), editAt: Date()),
    PDF(url: "", name: "test PDF -is;jdfkcmkd", createAt: Date(), editAt: Date()),
    PDF(url: "", name: "test PDF -as;fjoasjd482", createAt: Date(), editAt: Date()),
]

struct ContentView: View {
    var body: some View {
        NavigationSplitView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

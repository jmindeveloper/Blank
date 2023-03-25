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
        NavigationView {
            VStack {
                Divider()
                    .padding(.trailing)
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(dummyPDF, id: \.self) { pdf in
                        NavigationLink {
                            Text("\(pdf.name)")
                        } label: {
                            PDFCardView(pdf: pdf)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("내 파일")
            .toolbar {
                NavigationLink {
                    Text("파일선택")
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(.label))
                }
                
            }
        }
        .navigationViewStyle(.automatic)
        
    }
}

struct PDF: Hashable {
    let url: String
    var name: String
    var createAt: Date
    var editAt: Date
}



struct PDFCardView: View {
    
    @State var pdf: PDF
    
    var body: some View {
        VStack {
            HStack {
                Text(pdf.name)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(.label))
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .padding(.bottom, 4)
            
            HStack {
                Spacer()
                
                Text("2023년 3월 25일")
                    .foregroundColor(Color(.lightGray))
                    .padding(.trailing, 16)
            }
            
            Divider()
                .padding(.trailing)
        }
        .padding(.vertical, 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

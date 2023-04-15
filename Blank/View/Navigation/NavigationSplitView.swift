//
//  NavigationSplitView.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI

struct NavigationSplitView: View {
    
    @ObservedObject var document = Document()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(.trailing)
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(dummyPDF, id: \.self) { pdf in
                        NavigationLink {
                            BlankPDFRepresentableView(pdfDocument: document.document)
                        } label: {
                            BlankPDFNavigationCardView(pdf: pdf)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("내 파일")
            .toolbar {
                Button {
                    document.presentDocumentPicker()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(.label))
                }
            }
        }
        .navigationViewStyle(.automatic)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitView()
    }
}

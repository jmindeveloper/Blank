//
//  NavigationSplitView.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI

struct NavigationSplitView: View {
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
                            BlankPDFNavigationCardView(pdf: pdf)
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

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitView()
    }
}

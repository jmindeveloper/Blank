//
//  BlankPDFNavigationCardView.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI

struct BlankPDFNavigationCardView: View {
    
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
                
                Text(pdf.createAt.date2yyyyMMdd())
                    .foregroundColor(Color(.lightGray))
                    .padding(.trailing, 16)
            }
            
            Divider()
                .padding(.trailing)
        }
        .padding(.vertical, 4)
    }
}

struct BlankPDFNavigationCardView_Previews: PreviewProvider {
    static var previews: some View {
        BlankPDFNavigationCardView(pdf: dummyPDF[0])
    }
}

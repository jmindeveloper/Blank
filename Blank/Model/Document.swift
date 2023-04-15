//
//  Document.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers
import PDFKit


final class Document: NSObject, ObservableObject {
    
    /// 읽기타입
    private var readableContentTypes: [UTType] { [.pdf] }
    /// 쓰기타입
    private var writableContentTypes: [UTType] { [.pdf] }
    @Published var document: PDFDocument? = nil
    
    func presentDocumentPicker() {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: readableContentTypes)
        picker.allowsMultipleSelection = false
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        
        Constant.rootVC?.present(picker, animated: true)
    }
    
    func openPDF(url: URL) {
        if url.startAccessingSecurityScopedResource() {
            let pdfDocument = PDFDocument(url: url)
            document = pdfDocument
            url.stopAccessingSecurityScopedResource()
        }
    }
}

extension Document: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("실패ㅠ")
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print("url 가져오기 성공!! --> ",  urls.first!.lastPathComponent)
        print(urls.first!)
        openPDF(url: urls.first!)
    }
}

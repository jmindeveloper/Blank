//
//  Document.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers


final class Document: NSObject {
    
    /// 읽기타입
    private var readableContentTypes: [UTType] { [.pdf] }
    /// 쓰기타입
    private var writableContentTypes: [UTType] { [.pdf] }
    
    func presentDocumentPicker() {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: readableContentTypes)
        picker.allowsMultipleSelection = false
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        
        Constant.rootVC?.present(picker, animated: true)
    }
}

extension Document: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("실패ㅠ")
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print("url 가져오기 성공!! --> ",  urls.first!.lastPathComponent)
    }
}

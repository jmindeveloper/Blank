//
//  BlankPDFView.swift
//  Blank
//
//  Created by J_Min on 2023/04/15.
//

import UIKit
import PDFKit
import SnapKit

final class BlankPDFViewController: UIViewController {
    private let pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        view.displayMode = .singlePageContinuous
        view.displayDirection = .vertical
        
        return view
    }()
    
    var pdfDocument: PDFDocument? {
        didSet {
            loadPDF()
        }
    }
    
    init(pdfDocument: PDFDocument?) {
        self.pdfDocument = pdfDocument
        super.init(nibName: nil, bundle: nil)
    }

    convenience init() {
        self.init(pdfDocument: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubViews()
    }
    
    private func setSubViews() {
        view.addSubview(pdfView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        pdfView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func loadPDF() {
        if let document = pdfDocument {
            pdfView.document = document
        }
    }
}

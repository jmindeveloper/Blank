//
//  BlankPDFView.swift
//  Blank
//
//  Created by J_Min on 2023/04/15.
//

import UIKit
import PDFKit
import Combine
import SnapKit
import SwiftUI

final class BlankPDFViewController: UIViewController {
    private lazy var pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        view.displayMode = .singlePageContinuous
        view.displayDirection = .vertical
        
        return view
    }()
    
    private let pageNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2.withAlphaComponent(0.7)
        view.layer.cornerRadius = 8
        view.alpha = 0
        
        return view
    }()
    
    private let pageNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "1 of 6"
        
        return label
    }()
    
    var pdfDocument: PDFDocument? {
        didSet {
            loadPDF()
        }
    }
    
    private var pdfNumberTimer: Timer?
    
    private var subscriptions = Set<AnyCancellable>()
    
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
        binding()
    }
    
    private func binding() {
        NotificationCenter.default.publisher(for: .PDFViewPageChanged)
            .sink { [weak self] _ in
                guard let self = self else { return }
                guard let currentPage = self.pdfView.currentPage,
                      let currentPageIndex = self.pdfView.document?.index(for: currentPage),
                      let totalPageIndex = self.pdfView.document?.pageCount else {
                    return
                }
                self.pageNumberLabel.text = "\(currentPageIndex) of \(totalPageIndex)"
                
                if self.pageNumberView.alpha != 1 {
                    UIView.animate(withDuration: 0.3) {
                        self.pageNumberView.alpha = 1
                    }
                }
                self.startPDFNumberTimer()
            }.store(in: &subscriptions)
    }
    
    private func startPDFNumberTimer() {
        stopPDFNumberTimer()
        pdfNumberTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
            self?.stopPDFNumberTimer()
            UIView.animate(withDuration: 0.3) {
                self?.pageNumberView.alpha = 0
            }
        }
    }
    
    private func stopPDFNumberTimer() {
        pdfNumberTimer?.invalidate()
        pdfNumberTimer = nil
    }
    
    private func setSubViews() {
        [pdfView, pageNumberView].forEach {
            view.addSubview($0)
        }
        pageNumberView.addSubview(pageNumberLabel)
        
        setConstraints()
    }
    
    private func setConstraints() {
        pdfView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageNumberView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(pageNumberLabel).inset(-6)
            $0.verticalEdges.equalTo(pageNumberLabel).inset(-6)
            $0.top.leading.equalToSuperview().offset(16)
        }
        
        pageNumberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func loadPDF() {
        if let document = pdfDocument {
            pdfView.document = document
        }
    }
}

struct BlankPDFRepresentableView: UIViewControllerRepresentable {
    @State var pdfDocument: PDFDocument?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return BlankPDFViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard let pdfVC = uiViewController as? BlankPDFViewController else {
            return
        }
        
        pdfVC.pdfDocument = pdfDocument
    }
}

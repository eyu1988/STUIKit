//
//  STTitleView.swift
//  STUIKit
//
//  Created by Tiramisu on 2024/6/1.
//

import Foundation
import UIKit

open class STTitleView: UIView {
    open lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = self.titleFont
        label.textAlignment = .center
        return label
    }()

    public var titleFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium) {
        didSet {
            self.nameLabel.font = self.titleFont
        }
    }

    public init() {
        super.init(frame: .zero)
        self.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        if let superview = nameLabel.superview {
            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                nameLabel.topAnchor.constraint(equalTo: superview.topAnchor),
                nameLabel.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setTitle(title: String) {
        nameLabel.text = title
    }

    public func setTitleColor(color: UIColor) {
        nameLabel.textColor = color
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        self.nameLabel.textColor = self.tintColor
    }

    public override var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: UIView.layoutFittingExpandedSize.height
        )
    }
}

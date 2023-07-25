import UIKit

class NestedStackView: UIStackView {
    let leftLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    let rightLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addArrangedSubview(leftLabel)
        addArrangedSubview(rightLabel)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

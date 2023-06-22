
import UIKit
import SnapKit

class ResultViewController: UIViewController {
    private let background: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "result_background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let topLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.text = "YOUR RESULT"
        label.textColor = .white
        return label
    }()
    private let bmiLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 80, weight: .bold)
        label.textColor = .white
        return label
    }()
    private let adviceLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.textColor = .white
        return label
    }()
    private let closeButton: UIButton = {
       let button = UIButton()
        button.setTitle("RECALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(UIColor(named: "custom2"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func configure(bmiValue: String, advice: String, color: UIColor) {
        view.backgroundColor = color
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
    }
    func style() {
        view.addSubview(background)
        view.addSubview(topLabel)
        view.addSubview(bmiLabel)
        view.addSubview(adviceLabel)
        view.addSubview(closeButton)
    }
    func layout() {
        background.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        topLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        bmiLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        adviceLabel.snp.makeConstraints { make in
            make.top.equalTo(bmiLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
    }
   
    @objc func closeAction() {
        dismiss(animated: true, completion: nil)
    }
}

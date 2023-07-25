import UIKit
import SnapKit

 class CalculateViewController: UIViewController {
     private var calculator = Calculator()
     private let background: UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "calculate_background")
         imageView.contentMode = .scaleAspectFill
         return imageView
     }()
     private let topLabel: UILabel = {
        let label = UILabel()
         label.textAlignment = .left
         label.font = .systemFont(ofSize: 40, weight: .bold)
         label.text = "CALCULATE YOUR BMI"
         label.textColor = .darkGray
         label.numberOfLines = 0
         return label
     }()
     private let stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.alignment = .fill
         stackView.distribution = .fill
         stackView.spacing = 22
         return stackView
     }()
     private let nestedStackView: NestedStackView = {
         let stackView = NestedStackView()
         stackView.leftLabel.text = "Height"
         stackView.rightLabel.text = "1.5m"
         stackView.axis = .horizontal
         stackView.alignment = .fill
         stackView.distribution = .fill
         return stackView
     }()
     private var heightSlider: UISlider = {
        let slider = UISlider()
         slider.minimumValue = 0
         slider.maximumValue = 3
         slider.value = 1.5
         slider.minimumTrackTintColor = UIColor(named: "custom1")
         slider.thumbTintColor = UIColor(named: "custom2")
         return slider
     }()
     private let nestedStackView2: NestedStackView = {
         let stackView = NestedStackView()
         stackView.leftLabel.text = "Weight"
         stackView.rightLabel.text = "100Kg"
         stackView.axis = .horizontal
         stackView.alignment = .fill
         stackView.distribution = .fill
         return stackView
     }()
     private let weightSlider: UISlider = {
        let slider = UISlider()
         slider.minimumValue = 0
         slider.maximumValue = 200
         slider.value = 100
         slider.minimumTrackTintColor = UIColor(named: "custom1")
         slider.thumbTintColor = UIColor(named: "custom2")
         return slider
     }()
     private let calcButton: UIButton = {
        let button = UIButton()
         button.setTitle("CALCULATE", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
         button.backgroundColor = UIColor(named: "custom3")
         button.layer.cornerRadius = 20
         return button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setup()
    }
     
     func setup() {
         calcButton.addTarget(self, action: #selector(calcAction), for: .touchUpInside)
         heightSlider.addTarget(self, action: #selector(heightValueChanged(_:)), for: .valueChanged)
         weightSlider.addTarget(self, action: #selector(weightValueChanged(_:)), for: .valueChanged)
     }
    func style() {
        view.addSubview(background)
        view.addSubview(topLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(nestedStackView)
        stackView.addArrangedSubview(heightSlider)
        stackView.addArrangedSubview(nestedStackView2)
        stackView.addArrangedSubview(weightSlider)
        stackView.addArrangedSubview(calcButton)
     }
    func layout() {
         background.snp.makeConstraints { make in
             make.leading.top.trailing.bottom.equalToSuperview()
         }
        topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(-130)
            make.trailing.equalToSuperview().offset(-100)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        calcButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
     }
     
     @objc func calcAction(sender: UIButton) {
         calculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
         let resultVC = ResultViewController()
         resultVC.configure(bmiValue: calculator.getBMIValue(), advice: calculator.getAdvice(), color: calculator.getColor())
         resultVC.modalPresentationStyle = .popover
         self.present(resultVC, animated: true)
     }
     @objc func heightValueChanged(_ sender: UISlider) {
         nestedStackView.rightLabel.text = String(format: "%.2f", sender.value)
     }
     @objc func weightValueChanged(_ sender: UISlider) {
         nestedStackView2.rightLabel.text = String(format: "%.0f", sender.value)
     }
}

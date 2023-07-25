import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
}
struct Calculator {
    var bmi: BMI?
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/(height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(named: "customBlue")!)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(named: "customGreen")!)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(named: "customRed")!)
        }
    }
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .clear
    }
}


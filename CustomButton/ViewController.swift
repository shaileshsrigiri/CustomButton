import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton(title: "Tap Me 1!", topConstant: 300)
        createButton(title: "Tap Me 2!", topConstant: 390)
        createButton(title: "Tap Me 3!", topConstant: 480)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Creating an alert", message: "You tapped \(sender.currentTitle ?? "a button")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func createButton(title: String, topConstant: CGFloat) {
        let customButton = UIButton(type: .custom)
        
        customButton.setTitle(title, for: .normal)
        customButton.setTitleColor(.white, for: .normal)
        customButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        customButton.backgroundColor = .systemBlue
        customButton.layer.cornerRadius = 35
        customButton.layer.borderWidth = 2
        customButton.layer.borderColor = UIColor.white.cgColor
        customButton.layer.shadowColor = UIColor.black.cgColor
        customButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        customButton.layer.shadowRadius = 10
        customButton.layer.shadowOpacity = 0.3
        customButton.translatesAutoresizingMaskIntoConstraints = false
        //customButton.frame = CGRect(x: 100, y: topConstant, width: 200, height: 70)
        
        self.view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 200),
            customButton.heightAnchor.constraint(equalToConstant: 70),
            customButton.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant)
        ])

        customButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
}

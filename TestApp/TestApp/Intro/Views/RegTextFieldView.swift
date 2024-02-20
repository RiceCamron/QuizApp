//
//  RegTextField.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

class RegTextFieldView: UIView {
    let blockImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    let titleText: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(300))
        view.frame = CGRect(x: 50, y: 40, width: 190, height: 70)
        view.textColor = .white
        view.backgroundColor = .clear
        view.textAlignment = .center
        return view
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 150, y: 140, width: 200, height: 40)
        field.font = UIFont.systemFont(ofSize: 19)
        field.textColor = .white
        field.textAlignment = .center
        field.borderStyle = .none
        field.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return field
    }()
    
    var textFieldValue: String? {
            return textField.text
        }
    
    let bottomLine = UIView()
    
    var textDidChangeClosure: (() -> Void)?

    
    init(image: UIImage?, titleText: String, hintText: String?, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        
        
        self.blockImage.image = image
        self.titleText.text = titleText
        self.textField.placeholder = hintText
        self.textField.keyboardType = keyboardType
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white.withAlphaComponent(0.25),
                ]
                self.textField.attributedPlaceholder = NSAttributedString(string: hintText ?? "", attributes: placeholderAttributes)

        bottomLine.backgroundColor = .white.withAlphaComponent(0.5)
        bottomLine.layer.cornerRadius = 0.5
        bottomLine.frame = CGRect(x: 50, y: 140, width: 200, height: 1)
        
        setupViews()
        constrainViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrainViews() {
        blockImage.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
           blockImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }

    
    func setupViews() {
        setupView(blockImage)
        blockImage.addSubview(titleText)
        blockImage.addSubview(bottomLine)
        addSubview(textField)
    }
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    @objc private func textFieldDidChange() {
            // Call the closure when the text field changes
            textDidChangeClosure?()
        }
}


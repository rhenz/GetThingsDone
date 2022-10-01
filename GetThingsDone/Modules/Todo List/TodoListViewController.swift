//
//  TodoListViewController.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

class TodoListViewController: UIViewController {
    
    // MARK: - Views
    
    private let header = GTDHeaderView(headerTitle: "Stuff to get done")
    private let todoPopUpView = GTDTodoPopUpView()
    
    private var backgroundView: GTDGradientView = {
        let view = GTDGradientView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    // MARK: - Properties
    private var isTodoPopUpViewVisible = true
    private var todoPopUpViewBottomConstraint = NSLayoutConstraint()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupKeyboardObservers()
    }
}

// MARK: - Helper Methods
extension TodoListViewController {
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Setup UI

extension TodoListViewController {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        
        header.datasource = self
        header.delegate = self
        view.addSubview(header)
        
        todoPopUpView.delegate = self
        view.addSubview(todoPopUpView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let headerHeight: CGFloat = 120
        let padding: CGFloat = 20
        
        // Header
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: headerHeight)
        ])
        
        // Todo Popup
        todoPopUpViewBottomConstraint = todoPopUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([
            todoPopUpViewBottomConstraint,
            todoPopUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            todoPopUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        // Background View
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            backgroundView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: padding),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Actions
extension TodoListViewController {
    @objc func keyboardWillShow(sender: NSNotification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
           let keyboardDuration = sender.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
        {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            animatePopUpViewIfNeeded(withDuration: keyboardDuration.doubleValue, bottomYPosition: -keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        if let keyboardDuration = sender.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
            let popUpBottomYPosition = isTodoPopUpViewVisible ? 0 : todoPopUpView.bounds.height
            animatePopUpViewIfNeeded(withDuration: keyboardDuration.doubleValue, bottomYPosition: popUpBottomYPosition)
        }
    }
    
    func animatePopUpViewIfNeeded(withDuration duration: TimeInterval, bottomYPosition: CGFloat) {
        todoPopUpViewBottomConstraint.constant = bottomYPosition
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - GTDHeader Datasource
extension TodoListViewController: GTDHeaderViewDatasource {
    func gtdHeaderView(_ gtdHeaderView: GTDHeaderView, subtitleForLabel label: GTDLabel) -> String {
        return "1 left"
    }
}

// MARK: - GTDHeader Delegate
extension TodoListViewController: GTDHeaderViewDelegate {
    func gtdHeaderView(_ gtdHeaderView: GTDHeaderView, didTapAddButton button: UIButton) {
        // Show the popup
        isTodoPopUpViewVisible = true
        
        // Show keyboard
        todoPopUpView.textField.becomeFirstResponder()
    }
}

// MARK: - GTDPopUpView Delegate
extension TodoListViewController: GTDTodoPopUpViewDelegate {
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapAddButton addButton: UIButton, todoTextField textField: UITextField) {
        
    }
    
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapCancelButton addButton: UIButton) {
        // Hide the popup
        isTodoPopUpViewVisible = false
        
        // Hide keyboard
        todoPopUpView.textField.resignFirstResponder()
    }
}

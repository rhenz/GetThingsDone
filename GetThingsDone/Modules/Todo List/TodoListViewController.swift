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
        
        header.datasource = self
        header.delegate = self
        view.addSubview(header)
        
        todoPopUpView.delegate = self
        view.addSubview(todoPopUpView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let headerHeight: CGFloat = 120
        
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
            todoPopUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoPopUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapAddButton addButton: UIButton) {
        // Hide the popup and update the table view
    }
    
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapCancelButton addButton: UIButton) {
        // Hide the popup
        isTodoPopUpViewVisible = false
        
        // Hide keyboard
        todoPopUpView.textField.resignFirstResponder()
    }
}

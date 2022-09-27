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
            animatePopUpViewIfNeeded(withDuration: keyboardDuration.doubleValue, keyboardHeight: -keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        if let keyboardDuration = sender.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
            animatePopUpViewIfNeeded(withDuration: keyboardDuration.doubleValue, keyboardHeight: 0)
        }
    }
    
    func animatePopUpViewIfNeeded(withDuration duration: TimeInterval, keyboardHeight: CGFloat) {
        if isTodoPopUpViewVisible {
            todoPopUpViewBottomConstraint.constant = keyboardHeight
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
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
        print("Did tap add button")
    }
}

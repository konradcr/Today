//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Konrad Cureau on 29/03/2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}

//
//  View+Alert.swift
//  TableExampleSwiftUI
//
//  Created by Divyesh Vekariya on 15/10/24.
//

import SwiftUI

extension View {
    func alertPrompt(item: Binding<AlertPrompt?>) -> some View {
            var buttons: [Alert.Button] = []
        if let alert = item.wrappedValue {


            // Adding the positive button if provided
            if let positiveTitle = alert.positiveBtnTitle {
                let button = Alert.Button.default(Text(positiveTitle), action: {
                    alert.positiveBtnAction?()
                })
                let destructiveButton = Alert.Button.destructive(Text(positiveTitle), action: {
                    alert.positiveBtnAction?()
                })

                // Set as destructive if needed
                buttons
                    .append(
                        alert.isPositiveBtnDestructive ? button : destructiveButton
                    )
            }

            // Adding the negative button if provided
            if let negativeTitle = alert.negativeBtnTitle {
                buttons.append(Alert.Button.cancel(Text(negativeTitle), action: {
                    alert.negativeBtnAction?()
                }))
            }
        }
        return self
            .alert(item: item) { alert in
            // Return the alert with the buttons configured
                if buttons.count > 1 {
                    return Alert(title: Text(alert.title), message: Text(alert.message), primaryButton: buttons.first ?? .default(Text("OK")), secondaryButton: buttons.count > 1 ? buttons[1] : .cancel())
                } else if buttons.count == 1 {
                    return Alert(title: Text(alert.title), message: Text(alert.message), primaryButton: buttons.first ?? .default(Text("OK")), secondaryButton: buttons.count > 1 ? buttons[1] : .cancel())
                } else {
                    return Alert(
                        title: Text(alert.title),
                        message: Text(alert.message),
                        dismissButton: .cancel()
                    )
                }
        }
    }
}

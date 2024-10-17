
<img width="930" alt="mobile apps banner" src="https://github.com/canopas/rich-editor-swiftui/assets/73588408/84c94bbd-7952-45cb-9bfb-95e0687b37b0">

# **Building a Student Table in SwiftUI**

![TableExampleSwiftUI (1)](https://github.com/canopas/rich-editor-swiftui/assets/73588408/8c3013ae-8a27-4ebc-a511-51e726825c4b)

In this tutorial, we will create a simple and functional table to display student data using SwiftUI's `Table` view. This component is ideal for showing data in a structured, row-and-column format and offers features like sorting, filtering, multi-selection, and more. Our table will focus on a list of students and their grades across various subjects.

---

## **Step 1: Setting Up the Data Model**

Before we create the table, we need a model that represents our data. In this case, we'll be working with a **Student** model, which contains attributes like the student's name, ID, and their grades in different subjects (e.g., Math, Science, English, etc.).

### Key Attributes of the `Student` Model:
- **ID**: Each student has a unique identifier.
- **Name**: The name of the student.
- **Grade History**: A list of their subject grades for each semester.

The model is designed to hold information about multiple students and their respective academic performance across different subjects.

---

## **Step 2: Defining the Table View**

Once we have our student data, we can use SwiftUI’s `Table` component to display it in a tabular format. Here’s what happens:

### Table Columns
Each piece of student data (like the student’s name, ID, and grades for subjects such as Math and Science) is displayed in **columns**. We define a **column** for each attribute we want to display, such as:
- **Name**: Displays the student’s name.
- **ID**: Displays the student’s unique ID.
- **Subject Grades**: Displays their grades for subjects like Math, Science, and others.

### Row Representation
Each **row** in the table corresponds to a student. This means each row shows the name, ID, and grades for a particular student in the columns defined.

---

## **Step 3: Sorting and Filtering**

### Sorting
One of the most useful features of the SwiftUI `Table` is **sorting**. We can allow users to sort the students based on different criteria, like their name, ID, or their performance in individual subjects.

For instance, you could:
- Sort by **Name** to list students alphabetically.
- Sort by **Math Score** to rank students by their Math performance.

The sorting feature makes it easier to find specific data and organize the table based on what's most important to the user.

### Filtering
You can add **search and filtering** to allow users to quickly find specific students. By adding a search field, users can filter the table by student name, ID, or even by their grades in specific subjects. This improves the table's usability, especially when dealing with large datasets.

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/sorting_demo.gif" height="640" height="549" />
</p>
---

## **Step 4: Multi-Selection Support**

SwiftUI’s `Table` view allows for **multi-selection**, where users can select multiple rows at once. This is helpful when performing bulk actions, such as selecting several students to view or edit at once. For this, we bind the selection state to a set that tracks which students are selected.

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/multiple_selection_demo.gif" height="640" />
</p>
---

---

## **Step 5: Expanding Rows for More Details**

Sometimes, a single row of data doesn’t convey all the information we need. Using `DisclosureGroup`, we can make rows **expandable**, allowing the user to click and reveal more detailed information about the student. For instance, instead of showing all grades in a single row, users could click on a row to expand it and view a breakdown of the student’s performance across all subjects in more detail.

This feature is especially useful when displaying complex or large datasets where you want to keep the table tidy but still allow for deep dives into individual records.

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/expandable_row_demo.gif" height="640" />
</p>
---

## **Step 6: Searchable Table**

To enhance the user experience, you can make the table **searchable**. This feature lets users search for a student by their name or ID, or even filter based on specific grade criteria (e.g., all students with a Math grade above 90). The `searchable` modifier is added to the table, providing real-time filtering of the rows based on the user’s input.

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/search_demo.gif" height="640" />
</p>
---

## **Step 7: Adding a Context Menu**

### Context Menu Functionality

A **context menu** is a pop-up menu that appears when the user right-clicks (or long presses) on an item. In our case, we will add a context menu to each student row in the table to provide options such as:
- View more details about the student.
- Edit student information.
- Remove the student from the list.

### Implementation

To implement the context menu, you can add the `.contextMenu` modifier to each row in the table. This allows you to define actions that the user can take when they right-click on a student’s row.

1. **Define Actions**: Create functions to handle the actions in the context menu.
2. **Add Context Menu Modifier**: Attach the `.contextMenu` modifier to each row in the table.

### Example Code

Here’s a brief overview of how to implement the context menu without revealing too much code:

```swift
import SwiftUI

struct StudentTableView: View {
    let students: [Student]

    var body: some View {
        Table(students) {
            TableColumn("Name") { student in
                Text(student.name)
                    .contextMenu {
                        Button("View Details") {
                            // Action to view details
                            viewDetails(for: student)
                        }
                        Button("Edit Student") {
                            // Action to edit student
                            editStudent(student)
                        }
                        Button("Remove Student", role: .destructive) {
                            // Action to remove student
                            removeStudent(student)
                        }
                    }
            }
            TableColumn("ID") { student in
                Text(student.id)
            }
            TableColumn("Math") { student in
                Text("\(student.gradeHistory.subjects.math)")
            }
            // Add additional columns as necessary
        }
        .navigationTitle("Student List")
    }

    // Action methods
    private func viewDetails(for student: Student) {
        // Logic to view more details
    }

    private func editStudent(_ student: Student) {
        // Logic to edit student information
    }

    private func removeStudent(_ student: Student) {
        // Logic to remove the student
    }
}
```

### Breakdown of the Code:
- **Context Menu Modifier**: The context menu is attached to the student name column using `.contextMenu`.
- **Buttons**: Each button in the context menu corresponds to an action, like viewing details or editing the student. The `role: .destructive` modifier can be used for actions that remove data, providing a visual cue to the user.
- **Action Methods**: The `viewDetails`, `editStudent`, and `removeStudent` methods contain the logic for handling each action.

### User Experience

Adding a context menu enhances user experience by:
- Providing quick access to common actions without cluttering the interface.
- Allowing users to manage student records intuitively and efficiently.

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/context_manu_desktop_demo.gif" height="549" />
</p>

<p align="center">
    <img src =./TableExampleSwiftUI/docs/Assets/context_manu_ipad_demo.gif" height="640" />
</p>

## **Conclusion**

With the addition of a context menu, the `Student Table` becomes even more interactive and user-friendly. The combination of context menus with the robust features of SwiftUI's `Table` allows for a comprehensive data management tool that meets user needs efficiently.

This feature, combined with sorting, filtering, and expandable rows, creates a powerful interface for managing student records in a streamlined manner. By incorporating context menus, you empower users to quickly access functionalities, making your SwiftUI application more intuitive and responsive.
```

Feel free to modify any parts of the Markdown to better suit your needs!

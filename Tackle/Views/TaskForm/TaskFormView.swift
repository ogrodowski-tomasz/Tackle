import SwiftUI
import SwiftData

struct TaskFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String
    @State private var details: String
    @State private var isCompleted: Bool
    @State private var dueDate: Date?
    @State private var goalWeek: Int?
    @State private var priority: TaskPriority?
    
    private var taskToEdit: TaskModel?
    
    init(task: TaskModel? = nil) {
        self.taskToEdit = task
        _title = State(initialValue: task?.title ?? "")
        _details = State(initialValue: task?.details ?? "")
        _isCompleted = State(initialValue: task?.isCompleted ?? false)
        _dueDate = State(initialValue: task?.dueDate)
        _goalWeek = State(initialValue: task?.goalWeek)
        _priority = State(initialValue: task?.priority)
    }
    
    var body: some View {
        Form {
            Section("Task info") {
                TextField("Title", text: $title)
                TextEditor(text: $details)
                    .frame(minHeight: 80)
            }
            
            Section("Status") {
                Toggle("Completed", isOn: $isCompleted)
            }
            
            Section("Schedule") {
                DatePicker("Due Date", selection: Binding($dueDate, replacingNilWith: Date()), displayedComponents: [.date, .hourAndMinute])
                    .environment(\.locale, Locale.current)
                
                Stepper(value: Binding($goalWeek, replacingNilWith: Calendar.current.currentWeekNumber), in: 1...52) {
                    Text("Goal week: \(goalWeek ?? 0)")
                }
            }
            
            Section("Priority") {
                Picker("Priority", selection: Binding($priority, replacingNilWith: .medium)) {
                    ForEach(TaskPriority.allCases) { priority in
                        Text(priority.label)
                            .tag(priority as TaskPriority)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle(taskToEdit == nil ? "Add Task" : "Edit Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save", action: saveTask)
                    .disabled(title.isEmpty)
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
    
    func saveTask() {
        if let taskToEdit = taskToEdit {
            taskToEdit.title = title
            taskToEdit.details = details
            taskToEdit.isCompleted = isCompleted
            taskToEdit.dueDate = dueDate
            taskToEdit.goalWeek = goalWeek
            taskToEdit.priority = priority ?? .low
            taskToEdit.updatedAt = Date()
        } else {
            let newTask = TaskModel(
                title: title,
                details: details,
                isCompleted: isCompleted,
                createdAt: Date(),
                dueDate: dueDate,
                goalWeek: goalWeek,
                synced: false,
                priority: priority ?? .low
            )
            modelContext.insert(newTask)
        }
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
}

struct TaskFormView_Previews: PreviewProvider {
    static var sampleTask: TaskModel {
        TaskModel(
            title: "Prepare SwiftUI presentation",
            details: "Include examples of new features and best practices.",
            isCompleted: false,
            createdAt: Date().addingTimeInterval(-3600),
            dueDate: Date().addingTimeInterval(86400),
            goalWeek: 27,
            synced: true,
            updatedAt: Date(),
            priority: .high
        )
    }
    
    // Provide an in-memory ModelContext for SwiftData previews
    static var previewModelContext: ModelContext = {
        let container = try! ModelContainer(for: TaskModel.self)
        return ModelContext(container)
    }()
    
    static var previews: some View {
        Group {
            // Preview for adding a new task (empty form)
            TaskFormView()
                .previewDisplayName("Add New Task")
            
            // Preview for editing existing task (pre-filled form)
            TaskFormView(task: sampleTask)
                .previewDisplayName("Edit Existing Task")
        }
        .environment(\.modelContext, previewModelContext)  // Provide preview context
    }
    
   
}


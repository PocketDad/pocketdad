/// The data associated with users.
class TaskData {
  TaskData(
      {required this.id,
        required this.name,
        required this.description,
        required this.userIDs,
        required this.openDate,
        this.dueDate,
        this.location,
        this.completionDate,
        this.itemID,
        required this.notes,
        this.completed});

  String id;
  String name;
  String description;
  List<String> userIDs;
  DateTime openDate;
  DateTime? dueDate;
  DateTime? completionDate;
  String? location;
  String? itemID;
  List<String> notes;
  bool? completed;
}

/// Provides access to and operations on all defined users.
class TaskDB {
  final List<TaskData> _tasks = [
    TaskData(
        id: 'task-001',
        name: 'Wash Car',
        description: 'Nissan Versa should be cleaned',
        userIDs: ['user-001'],
        openDate: DateTime.parse('2023-07-20 20:18:04Z'),
        dueDate: DateTime.parse('2023-07-23 05:00:00Z'),
        completionDate: null,
        location: 'driveway',
        itemID: 'item-001',
        notes: ['Your car should be cleaned every month'],
        completed: false
    ),
    TaskData(
        id: 'task-002',
        name: 'Change Air filters',
        description: 'The air conditioner\'s filter should be changed once every 4 months.',
        userIDs: ['user-001'],
        openDate: DateTime.parse('2023-09-21 15:32:48Z'),
        dueDate: DateTime.parse('2023-07-24 04:00:00Z'),
        completionDate: null,
        location: '114 East-West Blvd',
        itemID: 'item-001',
        notes: ['Filters can be purchased on Amazon or at Home Depot'],
        completed: false
    ),
    TaskData(
        id: 'task-003',
        name: 'Wash Car',
        description: 'Nissan Versa should be cleaned',
        userIDs: ['user-001'],
        openDate: DateTime.parse('2023-07-20 20:18:04Z'),
        dueDate: DateTime.parse('2023-07-23 05:00:00Z'),
        completionDate: null,
        location: 'driveway',
        itemID: 'item-001',
        notes: ['Your car should be cleaned every month'],
        completed: false
    ),
    TaskData(
        id: 'task-004',
        name: 'Wash Car',
        description: 'Nissan Versa should be cleaned',
        userIDs: ['user-001'],
        openDate: DateTime.parse('2023-07-20 20:18:04Z'),
        dueDate: DateTime.parse('2023-07-23 05:00:00Z'),
        completionDate: null,
        location: 'driveway',
        itemID: 'item-001',
        notes: ['Your car should be cleaned every month'],
        completed: false
    ),
    TaskData(
        id: 'task-005',
        name: 'Wash Car',
        description: 'Nissan Versa should be cleaned',
        userIDs: ['user-001'],
        openDate: DateTime.parse('2023-07-20 20:18:04Z'),
        dueDate: DateTime.parse('2023-07-23 05:00:00Z'),
        completionDate: null,
        location: 'driveway',
        itemID: 'item-001',
        notes: ['Your car should be cleaned every month'],
        completed: false
    ),
  ];

  TaskData getTask(String taskID) {
    return _tasks.firstWhere((taskData) => taskData.id == taskID);
  }

  List<TaskData> getTasks(List<String> taskIDs) {
    return _tasks.where((taskData) => taskIDs.contains(taskData.id)).toList();
  }
}

/// The singleton instance providing access to all user data for clients.
TaskDB userDB = TaskDB();

/// The currently logged in user.
String currentUserID = 'user-005';
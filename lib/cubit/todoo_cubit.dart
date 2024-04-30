import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_using_sqflite/cubit/todo_states.dart';
import 'package:todo_app_using_sqflite/screens/Task_Screen/archieved_tasks_screen.dart';
import 'package:todo_app_using_sqflite/screens/Task_Screen/done_tasks_screen.dart';
import 'package:todo_app_using_sqflite/screens/Task_Screen/new_task_sreen.dart';

class AppCubit extends Cubit<toDoStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  int currentIndex = 0;
  List<Widget> screens = const [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchievedTasksScreen(),
  ];

  List<String> titles = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  List<Map>? tasks;
  late List<Map> archivedTasks;
  late List<Map> doneTasks;
  late Database database;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required IconData fabIcon2,
    required bool isShown,
  }) {
    fabIcon = fabIcon2;
    isBottomSheetShown = isShown;
    emit(BottomSheetState());
  }

  void createDatabase() async {
    openDatabase(
      'todo121.db',
      version: 1,
      onCreate: (database, v) {
        print('database created');
        database.execute('''CREATE TABLE Tasks
             (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT )''').then((value) => print('table created'));
      },
      onOpen: (database) {
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  void insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$time", "$date", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(InsertState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void updateData({required String status, required int id}) async {
    database.rawUpdate(
      'UPDATE Tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(UpdateState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(DeleteState());
    });
  }

  void getDataFromDatabase(Database database) {
    tasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(getDatafromDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      for (Map<String, Object?> element in value) {
        if (element['status'] == 'new') {
          tasks!.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      }

      emit(getDatafromDatabaseState());
    });
  }
}

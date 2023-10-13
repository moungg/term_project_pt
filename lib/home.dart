import 'package:flutter/material.dart';

class Task {
  final String image;
  final String title;
  final int repeatCount;
  final String expectedTime;

  Task({
    required this.image,
    required this.title,
    required this.repeatCount,
    required this.expectedTime,
  });
}

class Food {
  final String image;
  final String name;
  final int calories;

  Food({
    required this.image,
    required this.name,
    required this.calories,
  });
}

class HomePage extends StatelessWidget {
  final List<Task> tasks = [
    Task(
        image: 'assets/image1.png',
        title: 'Exercise 1',
        repeatCount: 3,
        expectedTime: '30 mins'),
    Task(
        image: 'assets/image2.png',
        title: 'Exercise 2',
        repeatCount: 2,
        expectedTime: '20 mins'),
  ];

  final List<Food> foods = [
    Food(image: 'assets/food1.png', name: 'Salad', calories: 300),
    Food(image: 'assets/food2.png', name: 'Fruit Bowl', calories: 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black,
            child: Text(
              '오늘의 할일',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return buildTaskItem(tasks[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black,
            child: Text(
              '오늘의 식단',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return buildFoodItem(foods[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTaskItem(Task task) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          // Handle task item tap
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(task.image),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: TextStyle(color: Colors.black)),
                  Text(
                      '반복 횟수: ${task.repeatCount}, 예상 시간: ${task.expectedTime}',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Checkbox(
                value: false,
                onChanged: (bool? value) {
                  // Handle checkbox state change
                },
                activeColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoodItem(Food food) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          // Handle food item tap
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(food.image),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name, style: TextStyle(color: Colors.black)),
                  Text('예상 칼로리: ${food.calories} kcal',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Checkbox(
                value: false,
                onChanged: (bool? value) {
                  // Handle checkbox state change
                },
                activeColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}
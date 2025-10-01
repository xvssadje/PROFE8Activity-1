import 'package:flutter/material.dart';
import 'dart:math' as math;

// Task 9: Creating a staggered grid layout demonstration
// Note: If flutter_staggered_grid_view package is available, use that instead
// This version uses built-in widgets with custom layout logic
class StaggeredGridPage extends StatelessWidget {
  final List<InterpreterCategory> categories = [
    InterpreterCategory(
      title: 'ASL Experts',
      count: 12,
      color: Colors.blue,
      icon: Icons.sign_language,
      height: 180.0,
    ),
    InterpreterCategory(
      title: 'FSL Specialists',
      count: 8,
      color: Colors.green,
      icon: Icons.language,
      height: 220.0,
    ),
    InterpreterCategory(
      title: 'Educational',
      count: 15,
      color: Colors.orange,
      icon: Icons.school,
      height: 160.0,
    ),
    InterpreterCategory(
      title: 'Medical',
      count: 10,
      color: Colors.red,
      icon: Icons.local_hospital,
      height: 240.0,
    ),
    InterpreterCategory(
      title: 'Legal',
      count: 6,
      color: Colors.purple,
      icon: Icons.gavel,
      height: 200.0,
    ),
    InterpreterCategory(
      title: 'Business',
      count: 9,
      color: Colors.teal,
      icon: Icons.business,
      height: 170.0,
    ),
    InterpreterCategory(
      title: 'Conference',
      count: 7,
      color: Colors.pink,
      icon: Icons.event,
      height: 210.0,
    ),
    InterpreterCategory(
      title: 'Emergency',
      count: 5,
      color: Colors.deepOrange,
      icon: Icons.emergency,
      height: 150.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interpreter Categories'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return StaggeredRow(
                    leftCategory: categories[index * 2],
                    rightCategory: index * 2 + 1 < categories.length
                        ? categories[index * 2 + 1]
                        : null,
                  );
                },
                childCount: (categories.length / 2).ceil(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaggeredRow extends StatelessWidget {
  final InterpreterCategory leftCategory;
  final InterpreterCategory? rightCategory;

  StaggeredRow({required this.leftCategory, this.rightCategory});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 5, bottom: 10),
            child: CategoryCard(category: leftCategory),
          ),
        ),
        if (rightCategory != null)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: CategoryCard(category: rightCategory!),
            ),
          ),
        if (rightCategory == null) Expanded(child: SizedBox()),
      ],
    );
  }
}

class InterpreterCategory {
  final String title;
  final int count;
  final Color color;
  final IconData icon;
  final double height;

  InterpreterCategory({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
    required this.height,
  });
}

class CategoryCard extends StatelessWidget {
  final InterpreterCategory category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${category.title}: ${category.count} interpreters'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        height: category.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.7),
              category.color.withOpacity(0.3),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: category.color.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.icon,
                  size: 35,
                  color: category.color,
                ),
              ),
              SizedBox(height: 12),
              Text(
                category.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${category.count} available',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: category.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

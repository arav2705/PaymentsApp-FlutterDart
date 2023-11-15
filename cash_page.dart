import 'package:cash_app/main.dart';
import 'package:flutter/material.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  List<Expense> expenses = [
    Expense(category: 'Groceries', amount: 250.0),
    Expense(category: 'Utilities', amount: 120.0),
    Expense(category: 'Entertainment', amount: 80.0),
    // Add more expenses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Expenses'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Expenses Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PaymentCategoryList(
                  expenses: expenses, onDelete: deleteExpense),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpenseDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddExpenseDialog() {
    TextEditingController categoryController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Expense'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Category:'),
              TextField(controller: categoryController),
              const SizedBox(height: 10),
              const Text('Amount:'),
              TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate and add the expense
                String category = categoryController.text.trim();
                String amountText = amountController.text.trim();
                if (category.isNotEmpty && amountText.isNotEmpty) {
                  double amount = double.parse(amountText);
                  addExpense(Expense(category: category, amount: amount));
                  Navigator.pop(context); // Close the dialog
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void deleteExpense(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Expense'),
          content: const Text('Are you sure you want to delete this expense?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteExpense(index);
                Navigator.pop(context); // Close the dialog
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteExpense(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }
}

class PaymentCategoryList extends StatelessWidget {
  final List<Expense> expenses;
  final Function(int) onDelete;

  const PaymentCategoryList({
    super.key,
    required this.expenses,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return PaymentCategoryCard(
          expense: expenses[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}

class PaymentCategoryCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;

  const PaymentCategoryCard({
    super.key,
    required this.expense,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.shopping_cart, color: Colors.white),
        ),
        title: Text(
          expense.category,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${expense.amount.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Handle editing the expense
                // This is where you can navigate to a form or a modal for editing the expense
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class Expense {
  final String category;
  final double amount;

  Expense({required this.category, required this.amount});
}

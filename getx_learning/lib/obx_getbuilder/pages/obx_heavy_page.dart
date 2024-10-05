/// Method 1: use 1 Obx for each widget

// // lib/pages/obx_heavy_page.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/obx_heavy_controller.dart';

// class ObxHeavyPage extends GetView<MyObxHeavyController> {
//   const ObxHeavyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Obx Heavy Example'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // First Counter
//             Obx(() {
//               print("Build counter 1 obx heavy");
//               if (controller.count1.value < 5) {
//                 print("Show loading indicator for Counter 1");
//                 return const LoadingIndicator(label: 'Counter 1');
//               }
//               return CounterWidget(
//                 label: 'Counter 1',
//                 count: controller.count1.value,
//                 onIncrement: controller.increment1,
//               );
//             }),
//             const Divider(),
//             // Second Counter
//             Obx(() {
//               print("Build counter 2 obx heavy");
//               if (controller.count2.value < 5) {
//                 print("Show loading indicator for Counter 2");
//                 return const LoadingIndicator(label: 'Counter 2');
//               }
//               return CounterWidget(
//                 label: 'Counter 2',
//                 count: controller.count2.value,
//                 onIncrement: controller.increment2,
//               );
//             }),
//             const Divider(),
//             // Third Counter
//             Obx(() {
//               print("Build counter 3 obx heavy");
//               if (controller.count3.value < 5) {
//                 print("Show loading indicator for Counter 3");
//                 return const LoadingIndicator(label: 'Counter 3');
//               }
//               return CounterWidget(
//                 label: 'Counter 3',
//                 count: controller.count3.value,
//                 onIncrement: controller.increment3,
//               );
//             }),
//             const Divider(),
//             // Fourth Counter
//             Obx(() {
//               print("Build counter 4 obx heavy");
//               if (controller.count4.value < 5) {
//                 print("Show loading indicator for Counter 4");
//                 return const LoadingIndicator(label: 'Counter 4');
//               }
//               return CounterWidget(
//                 label: 'Counter 4',
//                 count: controller.count4.value,
//                 onIncrement: controller.increment4,
//               );
//             }),
//             const Divider(),
//             // Fifth Counter
//             Obx(() {
//               print("Build counter 5 obx heavy");
//               if (controller.count5.value < 5) {
//                 print("Show loading indicator for Counter 5");
//                 return const LoadingIndicator(label: 'Counter 5');
//               }
//               return CounterWidget(
//                 label: 'Counter 5',
//                 count: controller.count5.value,
//                 onIncrement: controller.increment5,
//               );
//             }),
//             const Divider(),
//             // Nested Widgets Example
//             const NestedWidget(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.incrementAll,
//         tooltip: 'Increment All',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CounterWidget extends StatelessWidget {
//   final String label;
//   final int count;
//   final VoidCallback onIncrement;

//   const CounterWidget({
//     super.key,
//     required this.label,
//     required this.count,
//     required this.onIncrement,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Simulating a complex widget tree
//     print("Build CounterWidget obx heavy: $label");
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 4,
//         child: ExpansionTile(
//           title: Text('$label: $count'),
//           children: [
//             ElevatedButton(
//               onPressed: onIncrement,
//               child: const Icon(Icons.add),
//             ),
//             // Adding more nested widgets to make the tree heavy
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 print("Build nested item ${index + 1} obx heavy");
//                 return ListTile(
//                   title: Text('Nested Item ${index + 1}'),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NestedWidget extends StatelessWidget {
//   const NestedWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // A deeply nested widget tree
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         color: Colors.grey[200],
//         child: ExpansionTile(
//           title: const Text('Deeply Nested Widgets'),
//           children: List.generate(5, (i) {
//             print("Build deeply nested Level 1: item ${i + 1} obx heavy");
//             return ExpansionTile(
//               title: Text('Level 1 - Item ${i + 1}'),
//               children: List.generate(5, (j) {
//                 print(
//                     "Build deeply nested Level 2: item ${i + 1} ${j + 1} obx heavy");
//                 return ExpansionTile(
//                   title: Text('Level 2 - Item ${j + 1}'),
//                   children: List.generate(5, (k) {
//                     print(
//                         "Build deeply nested Level 3: item ${i + 1} ${j + 1} ${k + 1} obx heavy");
//                     return ListTile(
//                       title: Text('Level 3 - Item ${k + 1}'),
//                     );
//                   }),
//                 );
//               }),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// class LoadingIndicator extends StatelessWidget {
//   final String label;

//   const LoadingIndicator({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     print("Build LoadingIndicator for $label");
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         color: Colors.yellow[100],
//         elevation: 2,
//         child: ListTile(
//           leading: const CircularProgressIndicator(),
//           title: Text('Loading $label...'),
//         ),
//       ),
//     );
//   }
// }

/// Method 2: use 1 Obx for a big widget only
// lib/pages/obx_heavy_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/obx_heavy_controller.dart';

class ObxHeavyPage extends GetView<MyObxHeavyController> {
  const ObxHeavyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obx Heavy Example'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          print("Build entire page with a single Obx");

          return Column(
            children: [
              // First Counter
              if (controller.count1.value < 5)
                getLoadingIndicator()
              else
                CounterWidget(
                  label: 'Counter 1',
                  count: controller.count1.value,
                  onIncrement: controller.increment1,
                ),
              const Divider(),

              // Second Counter
              if (controller.count2.value < 5)
                const LoadingIndicator(label: 'Counter 2')
              else
                CounterWidget(
                  label: 'Counter 2',
                  count: controller.count2.value,
                  onIncrement: controller.increment2,
                ),
              const Divider(),

              // Third Counter
              if (controller.count3.value < 5)
                const LoadingIndicator(label: 'Counter 3')
              else
                CounterWidget(
                  label: 'Counter 3',
                  count: controller.count3.value,
                  onIncrement: controller.increment3,
                ),
              const Divider(),

              // Fourth Counter
              if (controller.count4.value < 5)
                const LoadingIndicator(label: 'Counter 4')
              else
                CounterWidget(
                  label: 'Counter 4',
                  count: controller.count4.value,
                  onIncrement: controller.increment4,
                ),
              const Divider(),

              // Fifth Counter
              if (controller.count5.value < 5)
                const LoadingIndicator(label: 'Counter 5')
              else
                CounterWidget(
                  label: 'Counter 5',
                  count: controller.count5.value,
                  onIncrement: controller.increment5,
                ),
              const Divider(),

              // Nested Widgets Example
              const NestedWidget(),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementAll,
        tooltip: 'Increment All',
        child: const Icon(Icons.add),
      ),
    );
  }

  LoadingIndicator getLoadingIndicator() {
    print("Build LoadingIndicator obx heavy");
    return const LoadingIndicator(label: 'Counter 1');
  }
}

class CounterWidget extends StatelessWidget {
  final String label;
  final int count;
  final VoidCallback onIncrement;

  const CounterWidget({
    super.key,
    required this.label,
    required this.count,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    // Simulating a complex widget tree
    print("Build CounterWidget obx heavy: $label");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ExpansionTile(
          title: Text('$label: $count'),
          children: [
            ElevatedButton(
              onPressed: onIncrement,
              child: const Icon(Icons.add),
            ),
            // Adding more nested widgets to make the tree heavy
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                print("Build nested item ${index + 1} obx heavy");
                return ListTile(
                  title: Text('Nested Item ${index + 1}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NestedWidget extends StatelessWidget {
  const NestedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // A deeply nested widget tree
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[200],
        child: ExpansionTile(
          title: const Text('Deeply Nested Widgets'),
          children: List.generate(5, (i) {
            print("Build deeply nested Level 1: item ${i + 1} obx heavy");
            return ExpansionTile(
              title: Text('Level 1 - Item ${i + 1}'),
              children: List.generate(5, (j) {
                print(
                    "Build deeply nested Level 2: item ${i + 1} ${j + 1} obx heavy");
                return ExpansionTile(
                  title: Text('Level 2 - Item ${j + 1}'),
                  children: List.generate(5, (k) {
                    print(
                        "Build deeply nested Level 3: item ${i + 1} ${j + 1} ${k + 1} obx heavy");
                    return ListTile(
                      title: Text('Level 3 - Item ${k + 1}'),
                    );
                  }),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final String label;

  const LoadingIndicator({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    print("Build LoadingIndicator for $label");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.yellow[100],
        elevation: 2,
        child: ListTile(
          leading: const CircularProgressIndicator(),
          title: Text('Loading $label...'),
        ),
      ),
    );
  }
}

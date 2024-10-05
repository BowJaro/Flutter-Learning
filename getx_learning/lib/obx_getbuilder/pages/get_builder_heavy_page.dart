/// Method 1: use a GetBuilder for each widget
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_builder_heavy_controller.dart';

class GetBuilderHeavyPage extends GetView<MyGetBuilderHeavyController> {
  const GetBuilderHeavyPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build entire page");
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetBuilder Heavy Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Counter
            GetBuilder<MyGetBuilderHeavyController>(
              builder: (_) {
                print("Build counter 1 get builder heavy");
                if (controller.count1 < 5) {
                  print("Show loading indicator for Counter 1");
                  return const LoadingIndicator(label: 'Counter 1');
                }
                return CounterWidget(
                  label: 'Counter 1',
                  count: controller.count1,
                  onIncrement: controller.increment1,
                );
              },
            ),
            const Divider(),
            // Second Counter
            GetBuilder<MyGetBuilderHeavyController>(
              builder: (_) {
                print("Build counter 2 get builder heavy");
                if (controller.count2 < 5) {
                  print("Show loading indicator for Counter 2");
                  return const LoadingIndicator(label: 'Counter 2');
                }
                return CounterWidget(
                  label: 'Counter 2',
                  count: controller.count2,
                  onIncrement: controller.increment2,
                );
              },
            ),
            const Divider(),
            // Third Counter
            GetBuilder<MyGetBuilderHeavyController>(
              builder: (_) {
                print("Build counter 3 get builder heavy");
                if (controller.count3 < 5) {
                  print("Show loading indicator for Counter 3");
                  return const LoadingIndicator(label: 'Counter 3');
                }
                return CounterWidget(
                  label: 'Counter 3',
                  count: controller.count3,
                  onIncrement: controller.increment3,
                );
              },
            ),
            const Divider(),
            // Fourth Counter
            GetBuilder<MyGetBuilderHeavyController>(
              builder: (_) {
                print("Build counter 4 get builder heavy");
                if (controller.count4 < 5) {
                  print("Show loading indicator for Counter 4");
                  return const LoadingIndicator(label: 'Counter 4');
                }
                return CounterWidget(
                  label: 'Counter 4',
                  count: controller.count4,
                  onIncrement: controller.increment4,
                );
              },
            ),
            const Divider(),
            // Fifth Counter
            GetBuilder<MyGetBuilderHeavyController>(
              builder: (_) {
                print("Build counter 5 get builder heavy");
                if (controller.count5 < 5) {
                  print("Show loading indicator for Counter 5");
                  return const LoadingIndicator(label: 'Counter 5');
                }
                return CounterWidget(
                  label: 'Counter 5',
                  count: controller.count5,
                  onIncrement: controller.increment5,
                );
              },
            ),
            const Divider(),
            // Nested Widgets Example
            const NestedWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementAll,
        tooltip: 'Increment All',
        child: const Icon(Icons.add),
      ),
    );
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
    print("Build CounterWidget get builder heavy: $label");
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
                print("Build nested item ${index + 1} get builder heavy");
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
            print(
                "Build deeply nested Level 1: item ${i + 1} get builder heavy");
            return ExpansionTile(
              title: Text('Level 1 - Item ${i + 1}'),
              children: List.generate(5, (j) {
                print(
                    "Build deeply nested Level 2: item ${i + 1} ${j + 1} get builder heavy");
                return ExpansionTile(
                  title: Text('Level 2 - Item ${j + 1}'),
                  children: List.generate(5, (k) {
                    print(
                        "Build deeply nested Level 3: item ${i + 1} ${j + 1} ${k + 1} get builder heavy");
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

// /// Method 2: use 1 GetBuilder for a big widget only
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/get_builder_heavy_controller.dart';

// class GetBuilderHeavyPage extends GetView<MyGetBuilderHeavyController> {
//   const GetBuilderHeavyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GetBuilder Heavy Example'),
//       ),
//       body: SingleChildScrollView(
//         child: GetBuilder<MyGetBuilderHeavyController>(
//           builder: (_) {
//             print("Build entire page with a single GetBuilder");

//             return Column(
//               children: [
//                 // First Counter
//                 if (controller.count1 < 5)
//                   getLoadingIndicator()
//                 else
//                   CounterWidget(
//                     label: 'Counter 1',
//                     count: controller.count1,
//                     onIncrement: controller.increment1,
//                   ),
//                 const Divider(),

//                 // Second Counter
//                 if (controller.count2 < 5)
//                   const LoadingIndicator(label: 'Counter 2')
//                 else
//                   CounterWidget(
//                     label: 'Counter 2',
//                     count: controller.count2,
//                     onIncrement: controller.increment2,
//                   ),
//                 const Divider(),

//                 // Third Counter
//                 if (controller.count3 < 5)
//                   const LoadingIndicator(label: 'Counter 3')
//                 else
//                   CounterWidget(
//                     label: 'Counter 3',
//                     count: controller.count3,
//                     onIncrement: controller.increment3,
//                   ),
//                 const Divider(),

//                 // Fourth Counter
//                 if (controller.count4 < 5)
//                   const LoadingIndicator(label: 'Counter 4')
//                 else
//                   CounterWidget(
//                     label: 'Counter 4',
//                     count: controller.count4,
//                     onIncrement: controller.increment4,
//                   ),
//                 const Divider(),

//                 // Fifth Counter
//                 if (controller.count5 < 5)
//                   const LoadingIndicator(label: 'Counter 5')
//                 else
//                   CounterWidget(
//                     label: 'Counter 5',
//                     count: controller.count5,
//                     onIncrement: controller.increment5,
//                   ),
//                 const Divider(),

//                 // Nested Widgets Example
//                 const NestedWidget(),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.incrementAll,
//         tooltip: 'Increment All',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   LoadingIndicator getLoadingIndicator() {
//     print("Build LoadingIndicator get builder heavy");
//     return const LoadingIndicator(label: 'Counter 1');
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
//     print("Build CounterWidget get builder heavy: $label");
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
//                 print("Build nested item ${index + 1} get builder heavy");
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
//             print(
//                 "Build deeply nested Level 1: item ${i + 1} get builder heavy");
//             return ExpansionTile(
//               title: Text('Level 1 - Item ${i + 1}'),
//               children: List.generate(5, (j) {
//                 print(
//                     "Build deeply nested Level 2: item ${i + 1} ${j + 1} get builder heavy");
//                 return ExpansionTile(
//                   title: Text('Level 2 - Item ${j + 1}'),
//                   children: List.generate(5, (k) {
//                     print(
//                         "Build deeply nested Level 3: item ${i + 1} ${j + 1} ${k + 1} get builder heavy");
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

import 'package:flutter/material.dart';
/* 
The process is carried out step by step as follows:

ex: List<int> list = [5, 2, 3, 4, 1];

1- The first element is considered to be sorted by itself.
2- The next element is placed in its appropriate position by comparing it with the previous elements.
3- This process continues until all the elements are sorted.
 */

class InsertionSort extends StatefulWidget {
  const InsertionSort({super.key});

  @override
  State<InsertionSort> createState() => _InsertionSortState();
}

class _InsertionSortState extends State<InsertionSort> {
  final myList = List<int>.generate(15, (index) => (index + 2) * 10);
  int holdItem = 0;
  int checked = 0;
  int remainingList = 0;

  void insertionSort(List<int> list) async {
    myList.shuffle();
    debugPrint(myList.toString());
    for (int i = 1; i < list.length; i++) {
      int j = i - 1;
      int key = list[i];
      holdItem = key;
      remainingList = i;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));

      while (j >= 0 && list[j] > key) {
        list[j + 1] = list[j];
        checked = list[j];
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 500));
        j--;
      }
      list[j + 1] = key;
      checked = 0;
      setState(() {});
    }
    debugPrint(myList.toString());
  }

  void shuffleList() {
    myList.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertion Sort'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('My List: ${myList.join(', ')}'),
            const SizedBox(height: 40),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  for (int a = 0; a < myList.length; a++)
                    Expanded(
                      child: Row(
                        children: [
                          if (remainingList == a)
                            Container(
                              width: 3,
                              height: 300,
                              color: Colors.black,
                            ),
                          Expanded(
                            child: Column(
                              children: [
                                if (holdItem == myList[a])
                                  const Icon(Icons.arrow_circle_down),
                                const Spacer(),
                                if (myList[a] == checked)
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Text(
                                      holdItem.toString(),
                                    ),
                                  ),
                                Container(
                                  height: myList[a].toDouble(),
                                  color: remainingList == a
                                      ? Colors.green
                                      : checked == myList[a]
                                          ? Colors.red
                                          : Colors.cyan,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    myList[a].toString(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () => insertionSort(myList),
                  child: const Text(
                    'Insertion Sort',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () => shuffleList(),
                  child: const Text(
                    'Shuffle My List',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

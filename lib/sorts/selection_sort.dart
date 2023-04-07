import 'package:flutter/material.dart';

/*

The steps of the algorithm are as follows:

ex: List<int> list = [1, 3, 2, 4, 5];

1- The first element of the array is considered to be the smallest element.
2- The remaining elements of the array are searched to find the smallest element.
3- The smallest element is changed with the first element of the array.
4- The first element is now sorted and the algorithm moves on to find
the smallest element in the remaining unsorted elements of the array.

*/

class SelectionSort extends StatefulWidget {
  const SelectionSort({super.key});

  @override
  State<SelectionSort> createState() => _SelectionSortState();
}

class _SelectionSortState extends State<SelectionSort> {
  final myList = List<int>.generate(20, (index) => index);
  int minIndex = 0;
  int smallestFound = 0;
  int searchedIndex = 0;

  void selectionSort(List<int> list) async {
    myList.shuffle();
    debugPrint(list.toString());
    for (int i = 0; i < list.length; i++) {
      int min = i;
      minIndex = i;
      for (int j = i + 1; j < list.length; j++) {
        searchedIndex = j;
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 100));
        if (list[j] < list[min]) {
          min = j;
          smallestFound = min;
          setState(() {});
        }
      }
      int temp = list[i];
      list[i] = list[min];
      list[min] = temp;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      smallestFound = i;
    }
    debugPrint(list.toString());
  }

  void shuffleList() {
    myList.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Selection Sort'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'My List: [${myList.join(', ')}]',
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  for (int a = 0; a < myList.length; a++)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: minIndex == a ? 3 : 1,
                            height: 300,
                            color: minIndex == a ? Colors.black : Colors.white,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                if (smallestFound == a)
                                  const Icon(Icons.arrow_circle_down),
                                const Spacer(),
                                Container(
                                  height: 10.0 * myList[a],
                                  color: minIndex == a
                                      ? Colors.red
                                      : searchedIndex == a
                                          ? Colors.green
                                          : smallestFound == a
                                              ? Colors.black
                                              : Colors.blue,
                                  child: Center(
                                    child: Text(
                                      '${myList[a]}',
                                      style: TextStyle(
                                        color: minIndex == a
                                            ? Colors.black
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                  onPressed: () => selectionSort(myList),
                  child: const Text(
                    'Selection Sort',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                  onPressed: () => shuffleList(),
                  child: const Text(
                    'Shuffle My List',
                    style: TextStyle(
                      color: Colors.black,
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

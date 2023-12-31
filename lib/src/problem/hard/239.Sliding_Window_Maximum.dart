/* 
239. Sliding Window Maximum

Description:
You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. 
You can only see the k numbers in the window. Each time the sliding window moves right by one position.

Return the max sliding window.


Example 1:
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7


Constraints:
* 1 <= nums.length <= 105
* -104 <= nums[i] <= 104
* 1 <= k <= nums.length
*/

import 'dart:collection';

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    final queue = Queue();
    final result = <int>[];

    for (int l = 0, r = 0; r < nums.length; ++r) {
      while (queue.isNotEmpty && nums[queue.last] < nums[r]) {
        queue.removeLast();
      }
      queue.add(r);

      if (l > queue.first) queue.removeFirst();

      if ((r + 1) >= k) {
        result.add(nums[queue.first]);
        l += 1;
      }
    }

    return result;
  }
}

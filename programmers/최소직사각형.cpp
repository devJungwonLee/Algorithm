#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int solution(vector<vector<int>> sizes) {
    int answer = 0, width = 0, height = 0;
    for (int i=0; i<sizes.size(); i++) {
        int w = min(sizes[i][0], sizes[i][1]);
        int h = max(sizes[i][0], sizes[i][1]);
        width = max(width, w);
        height = max(height, h);
    }
    answer = width * height;
    return answer;
}
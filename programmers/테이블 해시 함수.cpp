#include <string>
#include <vector>
#include <algorithm>
using namespace std;

void swap(vector<int> &a, vector<int> &b) {
    vector<int> temp = a;
    a = b;
    b = temp;
}

int solution(vector<vector<int>> data, int col, int row_begin, int row_end) {
    int answer = 0;
    vector<int> s;
    
    for (int i=0; i< data.size()-1; i++) {
        for (int j=0; j<data.size()-1-i; j++) {
            if (data[j][col-1] > data[j+1][col-1]) {
                swap(data[j], data[j+1]);
            } else if (data[j][col-1] == data[j+1][col-1]) {
                if (data[j][0] < data[j+1][0]) {
                    swap(data[j], data[j+1]);
                }
            } 
        }
    }
    
    for (int i=0; i<data.size(); i++) {
        int sum = 0;
        for (int j=0; j<data[i].size(); j++) {
            sum += data[i][j] % (i+1);
        }
        s.push_back(sum);
    }
    
    answer = s[row_begin-1];
    for (int i=row_begin; i<=row_end-1; i++) answer = answer ^ s[i];
    return answer;
}
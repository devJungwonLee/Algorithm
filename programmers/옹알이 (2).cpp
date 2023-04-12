#include <string>
#include <vector>

using namespace std;

int solution(vector<string> babbling) {
    int answer = 0;
    for (auto str: babbling) {
        string prev = "";
        bool flag = true;
        while (!str.empty()) {
            if (str.size()>=3 && str.substr(0, 3) == "aya" && prev != "aya") {
                str = str.substr(3, str.size()-3);
                prev = "aya";
                continue;
            }
            if (str.size()>=2 && str.substr(0, 2) == "ye" && prev != "ye") {
                str = str.substr(2, str.size()-2);
                prev = "ye";
                continue;
            }
            if (str.size()>=3 && str.substr(0, 3) == "woo" && prev != "woo") {
                str = str.substr(3, str.size()-3);
                prev = "woo";
                continue;
            }
            if (str.size()>=2 && str.substr(0, 2) == "ma" && prev != "ma") {
                str = str.substr(2, str.size()-2);
                prev = "ma";
                continue;
            }
            flag = false;
            break;
        }
        if (flag) answer++;
    }
    return answer;
}
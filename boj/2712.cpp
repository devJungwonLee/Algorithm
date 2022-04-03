#include <iostream>
#include <map>
using namespace std;

int main(void) {
    map<string, double> ratio;
    map<string, string> convertedUnit;
    ratio["kg"] = 2.2046;
    ratio["lb"] = 0.4536;
    ratio["l"] = 0.2642;
    ratio["g"] = 3.7854;
    convertedUnit["kg"] = "lb";
    convertedUnit["lb"] = "kg";
    convertedUnit["l"] = "g";
    convertedUnit["g"] = "l";
    int T;
    cin >> T;
    for (int t=0; t<T; t++) {
        double input;
        string unit;
        cin >> input >> unit;
        printf("%.4lf ", input*ratio[unit]);
        cout << convertedUnit[unit] << endl;
    }
    return 0;
}
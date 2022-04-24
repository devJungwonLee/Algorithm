#include <iostream>
#include <cmath>
#include <algorithm>
using namespace std;

double xa, ya, xb, yb, xc, yc;

bool isParallel() {
    if (xa==xb && xb==xc) return true;
    else if ((ya-yb)*(xb-xc) == (yb-yc)*(xa-xb)) return true;
    else return false;
}

double distance(double xp, double yp, double xq, double yq) {
    double result = 0;
    result += (xp-xq)*(xp-xq);
    result += (yp-yq)*(yp-yq);
    return sqrt(result);
}

double difference() {
    double dab = distance(xa, ya, xb, yb);
    double dbc = distance(xb, yb, xc, yc);
    double dca = distance(xc, yc, xa, ya);
    double maxValue = max(2*(dca+dab), max(2*(dab+dbc), 2*(dbc+dca)));
    double minValue = min(2*(dca+dab), min(2*(dab+dbc), 2*(dbc+dca)));
    return maxValue - minValue;
}

int main(void) {
    scanf("%lf %lf %lf %lf %lf %lf", &xa, &ya, &xb, &yb, &xc, &yc);
    if (isParallel()) printf("-1.0\n");
    else printf("%.16lf\n", difference());
    return 0;
}
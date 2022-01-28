#include <iostream>
#include <utility>
#include <vector>
#include <algorithm>
#include <cmath>
using namespace std;

vector<pair<double, double> > points; 
vector<int> xid;

int square(int x) {
    return x * x;
}

int dist(pair<double, double> a, pair<double, double> b) {
    int sqr = square((int)a.first-(int)b.first) + square((int)a.second-(int)b.second);
    return sqr;
}

bool cmpX(int &a, int &b) {
    return points[a].first < points[b].first;
}

bool cmpY(int &a, int &b) {
    return points[a].second < points[b].second;
}

int bruteForce(int left, int right) {
    pair<double, double> p1, p2, p3;
    p1 = points[xid[left]];
    p2 = points[xid[left+1]];
    int d1, d2, d3;
    d1 = dist(p1, p2);
    if (right == left + 1) return d1;
    p3 = points[xid[right]];
    d2 = dist(p1, p3);
    d3 = dist(p2, p3);
    return min(min(d1, d2), d3);
}

int middle(int from, int to) {
    vector<int> yid;
    for (int i=from; i<=to; i++) {
        yid.push_back(xid[i]);
    }
    sort(yid.begin(), yid.end(), cmpY);
    int d = 1000000000;
    for (int i=0; i<yid.size(); i++) {
        for (int j=i+1; j<=i+6 && j<yid.size(); j++) {
            pair<double, double> p1, p2;
            p1 = points[yid[i]];
            p2 = points[yid[j]];
            d = min(d, dist(p1, p2));
        }
    }
    return d;
}

int closestPair(int left, int right) {
    if (right <= left + 2) return bruteForce(left, right);
    int mid = (left + right) / 2;
    int d1 = closestPair(left, mid);
    int d2 = closestPair(mid+1, right);
    int d = min(d1, d2);
    double midX = points[xid[mid]].first;
    int from = mid, to = mid;
    while (from > left && points[xid[from-1]].first >= midX-sqrt((double)d)) from--;
    while (to < right && points[xid[to+1]].first <= midX+sqrt((double)d)) to++;
    int dMid = middle(from, to);
    return min(d, dMid);
}

int main(void) {
    int n;
    cin >> n;
    for (int i=0; i<n; i++) {
        double x, y;
        cin >> x >> y;
        points.push_back(make_pair(x, y));
        xid.push_back(i);
    }
    sort(xid.begin(), xid.end(), cmpX);
    int d = closestPair(0, n-1);
    cout << d << endl;
    return 0;
}
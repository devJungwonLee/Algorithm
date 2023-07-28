#include <iostream>
#include <set>
#include <map>
using namespace std;

int N, M, A, B, maxValue = 999999999;
set<int> s;
map<int, int> d;

int main(void)
{
    scanf("%d %d %d %d", &N, &M, &A, &B);
    for (int i = 0; i < M; i++)
    {
        int start, end;
        scanf("%d %d", &start, &end);
        for (int j = start; j <= end; j++)
            s.insert(j);
    }

    d[0] = 0;
    for (int i = 0; i <= N; i++)
    {
        if (s.count(i) || d.find(i) == d.end())
            continue;
        int j = i + A;
        if (j <= N && s.count(j) == 0)
        {
            int value = (d.find(j) == d.end()) ? maxValue : d[j];
            d[j] = min(value, d[i] + 1);
        }
        j = i + B;
        if (j <= N && s.count(j) == 0)
        {
            int value = (d.find(j) == d.end()) ? maxValue : d[j];
            d[j] = min(value, d[i] + 1);
        }
    }

    int answer = (d.find(N) == d.end()) ? -1 : d[N];
    printf("%d\n", answer);
    return 0;
}
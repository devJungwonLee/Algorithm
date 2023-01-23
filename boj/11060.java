import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class Main {
    static int N;
    static int[] a;
    static int[] v;
    static Queue<Integer> q = new LinkedList<>();
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        N = sc.nextInt();
        a = new int[N];
        v = new int[N];
        for (int i=0; i<N; i++) a[i] = sc.nextInt();
        sc.close();
        System.out.println(bfs());
    }

    static int bfs() {
        v[0] = 1;
        q.add(0);
        while (!q.isEmpty()) {
            int x = q.remove();
            if (x == N-1) return v[x] - 1;
            for (int y = x+1; y <= x + a[x]; y++) {
                if (y >= N || v[y] > 0) continue;
                v[y] = v[x] + 1;
                q.add(y);
            }
        }
        return -1;
    }
}
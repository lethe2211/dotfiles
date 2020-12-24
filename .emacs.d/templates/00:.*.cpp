#include <iostream>
#include <string>
#include <algorithm>
#include <functional>
#include <vector>
#include <queue>
#include <stack>
#include <map>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <utility>

#define INF 1000000001
#define EPS (1e-7)
#define REP(i,n) for(int i=0;i<n;i++)

using namespace std;

typedef long long unsigned int ll;
typedef pair<ll, ll> P;

long factorial(long n) {
  if (n <= 0) {
    return 1;
  } else {
    long k = 1;
    for (long i = 1; i <= n; i++) {
      k *= i;
    }
    return k;
  }
}

int main() {
  $0

  
  return 0;

}

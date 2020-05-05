// 1.cpp: 定义应用程序的入口点。
//

#include "cxsh.h"

#include "commands/base.h"

using namespace std;

int main() {
  commands::version();
  cout << "Hello CMake." << endl;
  return 0;
}

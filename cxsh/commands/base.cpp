#include "../console.h"
#include "../cxsh.h"

using namespace std;
namespace commands {
void version()
{
    cout << BLUE << "Cxsh version" << version << "\nbuild time" << buildTime;
    return;
}
} // namespace commands

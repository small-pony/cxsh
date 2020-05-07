#include "../console.h"
#include "../cxsh.h"

using namespace std;
namespace commands {
	void version() {
		cout << BLUE << "Cxsh version " << cxshVersion << "\nbuild time " << cxshBuildTime<<RESET<<endl;
		return;
	}
} // namespace commands

#ifndef CPPWORLD
#define CPPWORLD

#include <iostream>

class AbstractHypergraph {
	public:
		const virtual int root() = 0;
};

void print_root(AbstractHypergraph & hg) {
	std::cout << hg.root() << std::endl;
}

#endif

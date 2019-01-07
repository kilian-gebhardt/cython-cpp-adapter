#ifndef CPPAdapter
#define CPPAdapter

#include "SharedUtil.h"
#include "CppWorld.h"

class CppAdapterHG : public AbstractHypergraph {
	struct SharedHG * h;
	public:
		CppAdapterHG() : h(nullptr) {}
		CppAdapterHG(struct SharedHG * h) : h(h){}
		const int root() { return rootgetter(h); }		
};

#endif

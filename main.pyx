# distutils: language = c++
from SharedHG cimport SharedHG

cdef extern from "CppWorld.h":
    cdef cppclass AbstractHypergraph:
        pass
    cdef void print_root(AbstractHypergraph&)

cdef extern from "CppAdapter.h":
    cdef cppclass CppAdapterHG(AbstractHypergraph):
        CppAdapterHG() 
        CppAdapterHG(SharedHG) 

cdef class CythonHGImpl(SharedHG):
    cdef int _root

    def __cinit__(self, int root):
        self._root = root

    cpdef int root(self):
        return self._root

def main():
    cdef SharedHG hg = CythonHGImpl(5)

    print(hg.root())
    cdef CppAdapterHG a1 = CppAdapterHG(hg)
    print_root(a1)

    cdef SharedHG hg2 = SharedHG()
    print(hg2.root())
    cdef CppAdapterHG a2 = CppAdapterHG(hg2)
    print_root(a2)

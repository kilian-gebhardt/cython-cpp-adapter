# distutils: language = c++
from SharedHG cimport SharedHG

cdef public int rootgetter(SharedHG hg):
    return hg.root()


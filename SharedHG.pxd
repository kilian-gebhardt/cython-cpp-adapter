# distutils: language = c++

cdef public class SharedHG[object SharedHG, type pySharedHGType]:
    cpdef int root(self)

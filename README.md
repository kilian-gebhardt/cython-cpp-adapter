# cython-cpp-adapter
Adapter pattern for passing cython extension types to C++ functions

Lets assume that we have both a C++ codebase and a Python/Cython codebase that we want to interact. 
In particular, lets assume that there is a central interface in the C++ codebase relies on, 
that has different implementations in the Python/Cython codebase. Unfortunately (as far as I know), 
a cython extension type cannot inheret from an abstract C++ base class.

This repo contains the best solutions I came up with and uses a few layers of adapters. (As I want to work 
with hypergraphs, the shared interface are hypergraphs in the example. For simplicity only one function called 
`root` is implemented.)
- There is a shared interface that resides as a [public cython extension type](https://cython.readthedocs.io/en/latest/src/userguide/extension_types.html#public-and-external-extension-types) in a [`.pyx`](SharedHG.pyx)/[`.pxd `](SharedHG.pxy) file. 
(This needs to be a pxd file, because we want to provide different implementations in Cython.)
- There are getter and setter functions for the shared interface in a separate [`.pyx` file](SharedUtil.pyx). This is required, because `cythonize` does not generate a C/C++ header 
for public extension types from a `.pxd` file. (At least I didn't find out how to trick Cython to do this.)
- There is the actual C++ world (in [CppWorld.h](CppWorld.h)) that contains the C++ interface.
- There is an [adapter in a C++ header file](CppAdapter.h) that translates between the shared interface and the C++ interface.
- There is the [`main.pyx`](main.pyx) that contains an implementation of the shared interface
(which could be an adapter to another Python/Cython class). Here the C++ adapter is employed to convert the cython class into 
a C++ class and use it as argument in a C++ method.

For compilation execute (assuming `python == python3.7`): 

    python setup.py build_ext --inplace
    
and for running:

    python -c 'import main; main.main()'
    
    

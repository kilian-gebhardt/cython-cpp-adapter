from distutils.core import setup
from distutils.extension import Extension
from distutils.command.build_ext import build_ext
from Cython.Build import cythonize

setup(
    cmdclass = {'build_ext' : build_ext}, 
    ext_modules = cythonize([
        Extension("SharedHG", 
            sources=["SharedHG.pyx"],
            language="c++",
            )
        ])
)
setup(
    cmdclass = {'build_ext' : build_ext}, 
    ext_modules = cythonize([
        Extension("SharedUtil", 
            sources=["SharedUtil.pyx"],
            language="c++",
            )
        ])
)
setup(
    cmdclass = {'build_ext' : build_ext}, 
    ext_modules = cythonize([
        Extension("main", 
            sources=["main.pyx"],
            language="c++",
            extra_link_args=["SharedUtil.cpython-37m-x86_64-linux-gnu.so"]
            )
    ])
)

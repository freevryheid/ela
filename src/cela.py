import ctypes

# Load the shared library (update the path as needed)
lib = ctypes.CDLL('./libela.so')  # Change to the actual path of your .so file

# Define argument and return types for cela
lib.cela.argtypes = [
    ctypes.POINTER(ctypes.c_double),  # ela
    ctypes.POINTER(ctypes.c_double),  # veh
    ctypes.POINTER(ctypes.c_double),  # thk
    ctypes.POINTER(ctypes.c_double),  # mod
    ctypes.POINTER(ctypes.c_double),  # poi
    ctypes.POINTER(ctypes.c_double),  # wxpos
    ctypes.POINTER(ctypes.c_double),  # wypos
    ctypes.POINTER(ctypes.c_double),  # oxpos
    ctypes.POINTER(ctypes.c_double),  # oypos
    ctypes.c_int,                     # nlay
    ctypes.c_int,                     # nwhl
    ctypes.c_int                      # nloc
]
lib.cela.restype = None

def ela(ret, veh, thk, mod, poi, wxpos, wypos, oxpos, oypos, nlay, nwhl, nloc):
    lib.cela(
        ret.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        veh.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        thk.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        mod.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        poi.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        wxpos.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        wypos.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        oxpos.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        oypos.ctypes.data_as(ctypes.POINTER(ctypes.c_double)),
        ctypes.c_int(nlay),
        ctypes.c_int(nwhl),
        ctypes.c_int(nloc)
    )


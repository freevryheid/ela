import numpy as np
from cela import ela

def main():
    veh = np.array([10000, 125], dtype=np.float64)
    wxpos = np.zeros(10, dtype=np.float64)
    wypos = np.zeros(10, dtype=np.float64)
    oxpos = np.array([0, 8, 12, 18, 24, 36, 48, 60, 72], dtype=np.float64)
    oypos = np.array([0, 0, 0, 0, 0, 0, 0, 0, 0], dtype=np.float64)
    thk = np.array([8, 10, 36, 0], dtype=np.float64)
    mod = np.array([100000, 50000, 25000, 1000000], dtype=np.float64)
    poi = np.array([0.35, 0.35, 0.35, 0.35], dtype=np.float64)
    nlay = 4
    nwhl = 1
    nloc = 9
    ret = np.zeros((10, 3, 10), dtype=np.float64)
    # prop = [
    #     ["SXX", "SYY", "SZZ"],
    #     ["SXY", "SXZ", "SYZ"],
    #     ["PS1", "PS2", "PS3"],
    #     ["PSS1", "PSS2", "PSS3"],
    #     ["UX", "UY", "UZ"],
    #     ["EXX", "EYY", "EZZ"],
    #     ["EXY", "EXZ", "EYZ"],
    #     ["PE1", "PE2", "PE3"],
    #     ["PSE1", "PSE2", "PSE3"]
    # ]

    # Call cela from the shared library
    ela(ret, veh, thk, mod, poi, wxpos, wypos, oxpos, oypos, nlay, nwhl, nloc)

    d = np.array([ret[k][2][4] for k in range(nloc)])
    print(d)
    
    # for k in range(nloc):
    #     print(f"{prop[4][2]}: {ret[k][2][4]}")

if __name__ == "__main__":
    main()

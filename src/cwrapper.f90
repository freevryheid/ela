module wrapper
    use iso_c_binding, only: c_double, c_int
    use, intrinsic :: iso_fortran_env, only : dp => real64
    use elsym5
    implicit none

    contains
    
    subroutine cela(ret, veh, thk, mod, poi, wxp, wyp, oxp, oyp, nn, nw, no) bind(c, name="cela")
        real(c_double) :: ret(10,3,10)
        real(c_double) :: veh(2)
        real(c_double) :: thk(5)
        real(c_double) :: mod(5)
        real(c_double) :: poi(5)
        real(c_double) :: wxp(10)
        real(c_double) :: wyp(10)
        real(c_double) :: oxp(10)
        real(c_double) :: oyp(10)
        integer(c_int), value :: nn
        integer(c_int), value :: nw
        integer(c_int), value :: no
        ret = ela(veh, thk, mod, poi, wxp, wyp, oxp, oyp, nn, nw, no)
    end subroutine cela    
    
end module wrapper    

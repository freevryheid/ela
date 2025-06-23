program main
    use, intrinsic :: iso_fortran_env, only : dp => real64
    use elsym5
    implicit none
    real(dp) :: ret(10, 3, 10)
    integer :: i, j, k
    character(4), dimension(9,3) :: prop
    real(dp) :: veh(2)
    real(dp) :: thk(5)
    real(dp) :: mod(5)
    real(dp) :: poi(5)
    real(dp) :: wxp(10)
    real(dp) :: wyp(10)
    real(dp) :: oxp(10)
    real(dp) :: oyp(10)
    integer :: nlay
    integer :: nwhl
    integer :: nloc

    prop(1,:) = [ 'SXX',  'SYY',  'SZZ']
    prop(2,:) = [ 'SXY',  'SXZ',  'SYZ']
    prop(3,:) = [ 'PS1',  'PS2',  'PS3']
    prop(4,:) = ['PSS1', 'PSS2', 'PSS3']
    prop(5,:) = [  'UX',   'UY',   'UZ']
    prop(6,:) = [ 'EXX',  'EYY',  'EZZ']
    prop(7,:) = [ 'EXY',  'EXZ',  'EYZ']
    prop(8,:) = [ 'PE1',  'PE2',  'PE3']
    prop(9,:) = ['PSE1', 'PSE2', 'PSE3']
    
    veh = [10000.0, 125.0]

    oxp = [0.0, 8.0, 12.0, 18.0, 24.0, 36.0, 48.0, 60.0, 72.0, 0.0]
    oyp = [0.0, 0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0, 0.0]

    do i=1,10
      wxp(i) = 0.0
      wyp(i) = 0.0
    end do  

    thk = [8.0, 10.0, 36.0, 0.0, 0.0]
    mod = [100000.0, 50000.0, 25000.0, 1000000.0, 0.0]
    poi = [0.35, 0.35, 0.35, 0.35, 0.0]

    nlay = 4
    nwhl = 1
    nloc = 9

    ret = ela(veh, thk, mod, poi, wxp, wyp, oxp, oyp, nlay, nwhl, nloc)
    do k = 1, 9
        do j = 1, 3
            do i = 1, 9
                print *, "xpos: ", oxp(k), "ypos: ", oyp(k), prop(i, j), ": ", ret(i, j, k)
            end do
        end do
    end do    

end program main

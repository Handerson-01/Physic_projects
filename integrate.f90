program integrate
Implicit NONE
	REAL ::SUM,UPPER,LOWER,SIZE,f,e
	Integer :: n, TN
	sum = 0.0
	UPPER = 1.57080293
	LOWER =0	
e=-2
      

!declare number of traps
	TN = 100000
	SIZE = (UPPER - LOWER)/ TN
	sum = (1/2)*(f(lower) +f(upper))
!trap rule thing	
Do n=1, TN-1

		sum = sum + f(lower+(n*size))

	
end do

sum= sum*size

	print*, SUM
end program integrate


	

!change in fuctions 
 Function f(x)
	Implicit NONE
	REAL :: f,e
	REAL, intent(in):: x
	f= 1 !(4 * (sin(x)) * (sin(x)) - e**2- 4 * cos(x)) ** 0.5

end function 

program Hubbard
use, intrinsic :: ieee_arithmetic
Implicit NONE
REAL ::SUM,UPPER,LOWER,SIZE,f,e,k,deltaK, LOWER_2,UPPER_2,SUM_2,SIZE_2,total
Integer :: n, TN
UPPER = 0
LOWER =0
UPPER_2=2*3.141592653589 
SUM=0.0
SUM_2=0.0
        open(10, file="Hubbard_Data.txt", status="replace")
    k =0
    Deltak=.00001
   

e=-.0005
e=e+.00001
do while (abs(e)<.0005)
 !Take the value of e as input
 
k=0
!print*, "what is the value of e"
!read*, e

!checks limits if they are greater than 0. will only give out two limits
if(e>=0) then

	Do while (k<2*3.1415926) 
				if (abs((-e/2)-cos(k))<=1) then
LOWER=k
UPPER=(2*3.141592653589)-LOWER
exit
				end if
k=k+Deltak
	end do

TN = 100000
SIZE = (UPPER - LOWER)/ TN

sum = (1/2)*(f(e,lower) +f( e,upper))
!trap rule thing	
Do n=1, TN-1
sum = sum + f(e,lower+(n*size))

end do

sum= sum*size
print*, e,sum
write(10, *) e, sum

!if (ieee_is_finite(sum) .and. .not. ieee_is_nan(sum)) then

 !   else
  !      print*, "e, upper, lower" ,e, upper,lower

!write(10, *) "e, upper, lower" ,e, upper,lower

 !   end if
end if

!checks when e is -
if (e<0) then 

lower =0
upper_2=2*3.1415926535
	Do while (k<2*3.1415926535) 
		if (.not.abs((-e/2)-cos(k))<=1) then
upper=k-Deltak
exit
				end if
k=k+Deltak

end do

lower_2=2*3.14159265358-upper

TN = 100000
SIZE = (UPPER - LOWER)/ TN
sum = (.5)*(f(e,lower) + f(e,upper))



!trap rule thing	
Do n=1, TN-1

sum = sum + f(e,lower+(n*size))

end do

sum= sum*size



SIZE_2 = (UPPER_2 - LOWER_2)/ TN
sum_2 = (1/2)*(f(e,lower_2) +f(e,upper_2))
!trap rule thing	
Do n=1, TN-1

sum_2 = sum_2 + f(e,lower_2+(n*size_2))


end do

sum_2= sum_2*size_2
total= sum_2+sum

print*, e,total

write(10, *) e, total
!1if (ieee_is_finite(total) .and. .not. ieee_is_nan(total)) then

!    else
!        print*, "e, upper, lower" ,e, upper,lower
!print*, "upper_2, lower_2", upper_2,lower_2
!write(10, *) "e, upper, lower" ,e, upper,lower
!write(10, *) "upper_2, lower_2", upper_2, lower_2
!    end if

end if



 

e=e+.00001
end do  
close(10)
end program Hubbard

 Function f(e,x)
Implicit NONE
REAL :: f,t
REAL, intent(in):: x,e
t= 1.0
f= 1/(((4.0*(t**2) * (sin(x)) * (sin(x))) - (e**2)- (4 * t * e * cos(x))) ** 0.5)
!f=x**2




end function 
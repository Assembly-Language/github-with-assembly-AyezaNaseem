INCLUDE Irvine32.inc  

.data
  myArray word 2,-3,5,6,-9 
  msgSum byte "Sum of Positive Numbers : " ,0 
  msgCount byte "Total Positive Numbers: " ,0
  sum dword 0
  count dword 0 
.code
main PROC
  mov eax , 0
  mov esi , OFFSET myArray
  mov ecx,lengthof myArray
PositiveNumbers: 
  mov ax , word ptr[esi]
  test ax,8000h
  jnz skipPositive
  movsx eax,word ptr [esi]
  add sum,eax 
  add count , 1 
skipPositive:
  add esi,type myArray
  loop PositiveNumbers 
  mov edx ,OFFSET msgSum
  call writeString 
  call crlf
  mov eax , sum
  call writeint 
  call crlf
  mov edx , OFFSET msgCount
  call writeString
  call crlf
  mov eax , count
  call writeint
  exit

main ENDP
end main 
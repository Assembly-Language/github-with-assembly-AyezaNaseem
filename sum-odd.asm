INCLUDE Irvine32.inc  

.data
  myArray word 2,4,9,13,6 
  msgSum byte "Sum of Odd Numbers : " ,0 
  msgCount byte "Total Odd Numbers: " ,0
  sum dword 0
  count dword 0 
.code
main PROC
  mov eax , 0
  mov esi , OFFSET myArray
  mov ecx,lengthof myArray
  OddNumbers: 
  mov ax , word ptr[esi]
  test ax,1
  jz skipOdd
  movsx eax,word ptr [esi]
  add sum,eax 
  add count , 1 
skipOdd:
  add esi,type myArray
  loop OddNumbers 
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
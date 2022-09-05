main:
    lui s0, 0x10000 #posición inicial
    lui s4, 0x100 
    li s1, 0 
    li s2, 1
   
    
Fibonnacci: #función para sacar el primer valor de la serie
    add t3,s1,s2 #suma de los primeros dos digitos de la serie 0+1

Division: #solamente para los primeros dos digitos
    sub t4, t3, s2 #resta de t3 (suma de 0+1) y s2 (primer 1 de la serie)
    ori s11, s2, 0

FibonnacciAux:
    add t5,t3,s2 #suma de F-1 + F-2
    ori t4, t5, 0 #guarda en un registro como backup 
    li s8, 0 #contador pra cifras significativas
    li s3, 0 #inicio contador 
    li s10, 0 #para guardar el resultado del número áureo

VerificarCifras:
    li s7, 10 #condicion de parada de la cantidad de cifras significativas
    addi s8,s8 ,1 #aumenta el contador de cifras en 1
    bgt s8,s7, ResetFibonnacci
    li s3, 0

DivisionAux:
    ori s10, s9, 0
    sub t4, t4, t3 #resta de 2 - 1
    addi s3, s3 , 1 # aumenta el contador en 1
    beq t4, t3 , DivisionAux #compara que la resta sea igual al dividendo
    bgt t4,t3, DivisionAux # compara si la res s2ta es mayor al dividendo
    beq t4, s1, UltimaCifra #compara si la resta es igual a cero
    ori s5, t4, 0 #guarda en un nuevo registro el valor de t4
    li s6, 0 #nuevo contador para la formar numero
    li s9, 0 

InicializarValor: 
    add s10,s10,s3 # suma para formar el número áureo
    beq t4, s1, ResetFibonnacci

FormarNumero:
    li s7,10 #condicion de parada 
    add s9, s9, s10 #suma diez veces el mismo número
    addi s6, s6 ,1 #aumenta en 1 el contador de la multiplicación
    beq s6,s7, IniciarContadorMulti #cuando s6 y s7 son iguales sigue con el flujo
    bne s6,s7, FormarNumero #si no son iguales repite el proceso

UltimaCifra:
    add s10,s10,s3
    beq t4, s1, ResetFibonnacci #compara si la resta es igual a cero

IniciarContadorMulti:
    li s6, 0 #incializar contador para la multiplicación

Multiplicacion:
    add t4, t4, s5 #guarda en t4 la suma de t4 con s5 
    addi s6,s6,1 #aumenta el comtador de la multiplicación en 1
    li s7,9 #condición de parada
    beq s6,s7, VerificarCifras #compara si el contador es igual a la condicion de parada entonces vuelve a dividir
    bne s6,s7, Multiplicacion #compara si el contador no es igual a la condicion de parada y repite el proceso

ResetFibonnacci:
    ori s2, t3, 0 #actualiza el nuevo valor de s2
    ori t3, t5, 0 #catualiza el valor de t3
    li s7,11
    li s6, 0 
    li s9, 0
    ori a7, s11, 0 #cargar el resultado de la división anterior
    ori s11, s10, 0 #cargar el resultado de la división de esta iteración

Fin:
    beq a7, s11, Final
    bne a7, s11, FibonnacciAux

Final:
    li, s1, 0


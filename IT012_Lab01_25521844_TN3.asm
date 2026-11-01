#Nguyen Ngoc Bao Thy 25521844
# Ma nguon 5 - in mot thong bao va mot so nguyen

.data

msg:   .asciiz "Dien nang (kWh): "

nl:    .asciiz "\n"

 

.text

.globl main

main:

    addi $t0, $zero, 150

    li   $v0, 4              # dich vu 4: in chuoi

    la   $a0, msg            # doi so: dia chi cua msg

    syscall

    li   $v0, 1              # dich vu 1: in so nguyen

    add  $a0, $t0, $zero     # doi so: so can in

    syscall

    li   $v0, 4              # in xuong dong

    la   $a0, nl

    syscall

    li   $v0, 10             # dich vu 10: ket thuc

    syscall

#Nguyen Ngoc Bao Thy 25521844
# Ma nguon 6 - dien nang tieu thu giua hai chi so

.data

prompt1: .asciiz "Nhap chi so cu (kWh): "

prompt2: .asciiz "Nhap chi so moi (kWh): "

label:   .asciiz "Dien nang (kWh): "

newline: .asciiz "\n"

 

.text

.globl main

main:

    # --- doc chi so cu vao $s0 ---

    li   $v0, 4

    la   $a0, prompt1

    syscall

    li   $v0, 5              # dich vu 5: doc so nguyen, ket qua o $v0

    syscall

    add  $s0, $v0, $zero     # giu gia tri trong $s0

 

    # >>> doc chi so moi vao $s1 (in prompt2, roi dich vu 5)
	li   $v0, 4
   	la   $a0, prompt2
   	syscall
   	li   $v0, 5
   	syscall
   	add  $s1, $v0, $zero

    # >>> usage = current - previous, vao $t0
	sub  $t0, $s1, $s0
    	li   $v0, 4
    	la   $a0, label
    	syscall
 

    # >>> in label, roi usage (dich vu 1), roi newline
	li   $v0, 1             
    	add  $a0, $t0, $zero     
    	syscall                
    	li   $v0, 4             
    	la   $a0, newline
    	syscall
    	li   $v0, 10
    	syscall

# Nguyen Ngoc Bao Thy 25521844
# Ma nguon 7 - Tong hop dien nang tieu thu 3 thang

.data

prompt: .asciiz "Nhap chi so (kWh): "

m1:     .asciiz "Thang 1: "

m2:     .asciiz "Thang 2: "

m3:     .asciiz "Thang 3: "

tot:    .asciiz "Tong:    "

nl:     .asciiz "\n"


.text
.globl main
main:
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s3, $v0

    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1    
    sub  $t2, $s3, $s2 
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2


    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall

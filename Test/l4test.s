.data 
_prompt: .asciiz "Enter an integer:" 
_ret: .asciiz "\n" 
.globl main 
.text 
read: 
  li $v0, 4 
  la $a0, _prompt 
  syscall 
  li $v0, 5
  syscall
  jr $ra

write:
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, _ret
  syscall
  move $v0, $0
  jr $ra

main:
  move $fp, $sp
  addi $sp, $sp, -32
  li $t1, 0
  sw $t1, -4($fp)
  li $t1, 1
  sw $t1, -8($fp)
  li $t1, 0
  sw $t1, -12($fp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  jal read
  move $sp, $fp
  lw $fp, 0($sp)
  addi $sp, $sp, 4
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t1, $v0
  sw $t1, -16($fp)
  lw $t2, -16($fp)
  move $t1, $t2
  sw $t1, -20($fp)
label1:
  lw $t1, -12($fp)
  lw $t2, -20($fp)
  blt $t1, $t2, label2
  j label3
label2:
  lw $t2, -4($fp)
  lw $t3, -8($fp)
  add $t1, $t2, $t3
  sw $t1, -24($fp)
  lw $t2, -24($fp)
  move $t1, $t2
  sw $t1, -28($fp)
  lw $t2, -8($fp)
  move $a0, $t2
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  addi $sp, $sp, -4
  sw $fp, 0($sp)
  move $fp, $sp
  jal write
  move $sp, $fp
  lw $fp, 0($sp)
  addi $sp, $sp, 4
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t2, -8($fp)
  move $t1, $t2
  sw $t1, -4($fp)
  lw $t2, -28($fp)
  move $t1, $t2
  sw $t1, -8($fp)
  lw $t2, -12($fp)
  addi $t1, $t2, 1
  sw $t1, -32($fp)
  lw $t2, -32($fp)
  move $t1, $t2
  sw $t1, -12($fp)
  j label1
label3:
  move $v0, $0
  jr $ra


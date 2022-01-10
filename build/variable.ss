
variable.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	48 83 ec 20          	sub    $0x20,%rsp
   c:	48 c7 45 e8 03 00 00 	movq   $0x3,-0x18(%rbp)
  13:	00 
  14:	48 c7 45 f0 02 00 00 	movq   $0x2,-0x10(%rbp)
  1b:	00 
  1c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  24:	48 01 d0             	add    %rdx,%rax
  27:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  2b:	48 c7 45 e8 04 00 00 	movq   $0x4,-0x18(%rbp)
  32:	00 
  33:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3a <main+0x3a>
  3a:	e8 00 00 00 00       	callq  3f <main+0x3f>
  3f:	b8 00 00 00 00       	mov    $0x0,%eax
  44:	c9                   	leaveq 
  45:	c3                   	retq   


a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmpq *0x2fe3(%rip)        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nopl   (%rax)
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	pushq  $0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmpq 401020 <.plt>
  40103f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401040 <puts@plt>:
  401040:	f3 0f 1e fa          	endbr64 
  401044:	f2 ff 25 cd 2f 00 00 	bnd jmpq *0x2fcd(%rip)        # 404018 <puts@GLIBC_2.2.5>
  40104b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401050 <main>:
  401050:	f3 0f 1e fa          	endbr64 
  401054:	55                   	push   %rbp
  401055:	48 89 e5             	mov    %rsp,%rbp
  401058:	48 83 ec 20          	sub    $0x20,%rsp
  40105c:	48 c7 45 e8 03 00 00 	movq   $0x3,-0x18(%rbp)
  401063:	00 
  401064:	48 c7 45 f0 02 00 00 	movq   $0x2,-0x10(%rbp)
  40106b:	00 
  40106c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  401070:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401074:	48 01 d0             	add    %rdx,%rax
  401077:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40107b:	48 c7 45 e8 04 00 00 	movq   $0x4,-0x18(%rbp)
  401082:	00 
  401083:	48 8d 3d 76 0f 00 00 	lea    0xf76(%rip),%rdi        # 402000 <_fini+0xea8>
  40108a:	e8 b1 ff ff ff       	callq  401040 <puts@plt>
  40108f:	b8 00 00 00 00       	mov    $0x0,%eax
  401094:	c9                   	leaveq 
  401095:	c3                   	retq   
  401096:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40109d:	00 00 00 

00000000004010a0 <_start>:
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	31 ed                	xor    %ebp,%ebp
  4010a6:	49 89 d1             	mov    %rdx,%r9
  4010a9:	5e                   	pop    %rsi
  4010aa:	48 89 e2             	mov    %rsp,%rdx
  4010ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4010b1:	50                   	push   %rax
  4010b2:	54                   	push   %rsp
  4010b3:	49 c7 c0 50 11 40 00 	mov    $0x401150,%r8
  4010ba:	48 c7 c1 e0 10 40 00 	mov    $0x4010e0,%rcx
  4010c1:	48 c7 c7 50 10 40 00 	mov    $0x401050,%rdi
  4010c8:	ff 15 22 2f 00 00    	callq  *0x2f22(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  4010ce:	f4                   	hlt    
  4010cf:	90                   	nop

00000000004010d0 <_dl_relocate_static_pie>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	c3                   	retq   
  4010d5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4010dc:	00 00 00 
  4010df:	90                   	nop

00000000004010e0 <__libc_csu_init>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	41 57                	push   %r15
  4010e6:	4c 8d 3d 63 2d 00 00 	lea    0x2d63(%rip),%r15        # 403e50 <_DYNAMIC>
  4010ed:	41 56                	push   %r14
  4010ef:	49 89 d6             	mov    %rdx,%r14
  4010f2:	41 55                	push   %r13
  4010f4:	49 89 f5             	mov    %rsi,%r13
  4010f7:	41 54                	push   %r12
  4010f9:	41 89 fc             	mov    %edi,%r12d
  4010fc:	55                   	push   %rbp
  4010fd:	48 8d 2d 4c 2d 00 00 	lea    0x2d4c(%rip),%rbp        # 403e50 <_DYNAMIC>
  401104:	53                   	push   %rbx
  401105:	4c 29 fd             	sub    %r15,%rbp
  401108:	48 83 ec 08          	sub    $0x8,%rsp
  40110c:	e8 ef fe ff ff       	callq  401000 <_init>
  401111:	48 c1 fd 03          	sar    $0x3,%rbp
  401115:	74 1f                	je     401136 <__libc_csu_init+0x56>
  401117:	31 db                	xor    %ebx,%ebx
  401119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401120:	4c 89 f2             	mov    %r14,%rdx
  401123:	4c 89 ee             	mov    %r13,%rsi
  401126:	44 89 e7             	mov    %r12d,%edi
  401129:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40112d:	48 83 c3 01          	add    $0x1,%rbx
  401131:	48 39 dd             	cmp    %rbx,%rbp
  401134:	75 ea                	jne    401120 <__libc_csu_init+0x40>
  401136:	48 83 c4 08          	add    $0x8,%rsp
  40113a:	5b                   	pop    %rbx
  40113b:	5d                   	pop    %rbp
  40113c:	41 5c                	pop    %r12
  40113e:	41 5d                	pop    %r13
  401140:	41 5e                	pop    %r14
  401142:	41 5f                	pop    %r15
  401144:	c3                   	retq   
  401145:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40114c:	00 00 00 00 

0000000000401150 <__libc_csu_fini>:
  401150:	f3 0f 1e fa          	endbr64 
  401154:	c3                   	retq   

Disassembly of section .fini:

0000000000401158 <_fini>:
  401158:	f3 0f 1e fa          	endbr64 
  40115c:	48 83 ec 08          	sub    $0x8,%rsp
  401160:	48 83 c4 08          	add    $0x8,%rsp
  401164:	c3                   	retq   

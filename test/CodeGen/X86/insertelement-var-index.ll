; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse4.1 | FileCheck %s --check-prefixes=ALL,SSE
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx    | FileCheck %s --check-prefixes=ALL,AVX,AVX1
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx2   | FileCheck %s --check-prefixes=ALL,AVX,AVX2

define <16 x i8> @arg_i8_v16i8(i8 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i8_v16i8:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $15, %esi
; SSE-NEXT:    movb %dil, -24(%rsp,%rsi)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i8_v16i8:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $15, %esi
; AVX-NEXT:    movb %dil, -24(%rsp,%rsi)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <16 x i8> undef, i8 %x, i32 %y
  ret <16 x i8> %ins
}

define <8 x i16> @arg_i16_v8i16(i16 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i16_v8i16:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $7, %esi
; SSE-NEXT:    movw %di, -24(%rsp,%rsi,2)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i16_v8i16:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $7, %esi
; AVX-NEXT:    movw %di, -24(%rsp,%rsi,2)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <8 x i16> undef, i16 %x, i32 %y
  ret <8 x i16> %ins
}

define <4 x i32> @arg_i32_v4i32(i32 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i32_v4i32:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movl %edi, -24(%rsp,%rsi,4)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i32_v4i32:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    movl %edi, -24(%rsp,%rsi,4)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <4 x i32> undef, i32 %x, i32 %y
  ret <4 x i32> %ins
}

define <2 x i64> @arg_i64_v2i64(i64 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i64_v2i64:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $1, %esi
; SSE-NEXT:    movq %rdi, -24(%rsp,%rsi,8)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i64_v2i64:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $1, %esi
; AVX-NEXT:    movq %rdi, -24(%rsp,%rsi,8)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <2 x i64> undef, i64 %x, i32 %y
  ret <2 x i64> %ins
}

define <4 x float> @arg_f32_v4f32(float %x, i32 %y) nounwind {
; SSE-LABEL: arg_f32_v4f32:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $edi killed $edi def $rdi
; SSE-NEXT:    andl $3, %edi
; SSE-NEXT:    movss %xmm0, -24(%rsp,%rdi,4)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_f32_v4f32:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $edi killed $edi def $rdi
; AVX-NEXT:    andl $3, %edi
; AVX-NEXT:    vmovss %xmm0, -24(%rsp,%rdi,4)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <4 x float> undef, float %x, i32 %y
  ret <4 x float> %ins
}

define <2 x double> @arg_f64_v2f64(double %x, i32 %y) nounwind {
; SSE-LABEL: arg_f64_v2f64:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $edi killed $edi def $rdi
; SSE-NEXT:    andl $1, %edi
; SSE-NEXT:    movsd %xmm0, -24(%rsp,%rdi,8)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_f64_v2f64:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $edi killed $edi def $rdi
; AVX-NEXT:    andl $1, %edi
; AVX-NEXT:    vmovsd %xmm0, -24(%rsp,%rdi,8)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %ins = insertelement <2 x double> undef, double %x, i32 %y
  ret <2 x double> %ins
}

define <16 x i8> @load_i8_v16i8(i8* %p, i32 %y) nounwind {
; SSE-LABEL: load_i8_v16i8:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movb (%rdi), %al
; SSE-NEXT:    andl $15, %esi
; SSE-NEXT:    movb %al, -24(%rsp,%rsi)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i8_v16i8:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movb (%rdi), %al
; AVX-NEXT:    andl $15, %esi
; AVX-NEXT:    movb %al, -24(%rsp,%rsi)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <16 x i8> undef, i8 %x, i32 %y
  ret <16 x i8> %ins
}

define <8 x i16> @load_i16_v8i16(i16* %p, i32 %y) nounwind {
; SSE-LABEL: load_i16_v8i16:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    andl $7, %esi
; SSE-NEXT:    movw %ax, -24(%rsp,%rsi,2)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i16_v8i16:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    andl $7, %esi
; AVX-NEXT:    movw %ax, -24(%rsp,%rsi,2)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <8 x i16> undef, i16 %x, i32 %y
  ret <8 x i16> %ins
}

define <4 x i32> @load_i32_v4i32(i32* %p, i32 %y) nounwind {
; SSE-LABEL: load_i32_v4i32:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movl (%rdi), %eax
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movl %eax, -24(%rsp,%rsi,4)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i32_v4i32:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movl (%rdi), %eax
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    movl %eax, -24(%rsp,%rsi,4)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <4 x i32> undef, i32 %x, i32 %y
  ret <4 x i32> %ins
}

define <2 x i64> @load_i64_v2i64(i64* %p, i32 %y) nounwind {
; SSE-LABEL: load_i64_v2i64:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movq (%rdi), %rax
; SSE-NEXT:    andl $1, %esi
; SSE-NEXT:    movq %rax, -24(%rsp,%rsi,8)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i64_v2i64:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movq (%rdi), %rax
; AVX-NEXT:    andl $1, %esi
; AVX-NEXT:    movq %rax, -24(%rsp,%rsi,8)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <2 x i64> undef, i64 %x, i32 %y
  ret <2 x i64> %ins
}

define <4 x float> @load_f32_v4f32(float* %p, i32 %y) nounwind {
; SSE-LABEL: load_f32_v4f32:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movss %xmm0, -24(%rsp,%rsi,4)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_f32_v4f32:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    vmovss %xmm0, -24(%rsp,%rsi,4)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <4 x float> undef, float %x, i32 %y
  ret <4 x float> %ins
}

define <2 x double> @load_f64_v2f64(double* %p, i32 %y) nounwind {
; SSE-LABEL: load_f64_v2f64:
; SSE:       # %bb.0:
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    andl $1, %esi
; SSE-NEXT:    movsd %xmm0, -24(%rsp,%rsi,8)
; SSE-NEXT:    movaps -{{[0-9]+}}(%rsp), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: load_f64_v2f64:
; AVX:       # %bb.0:
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    andl $1, %esi
; AVX-NEXT:    vmovsd %xmm0, -24(%rsp,%rsi,8)
; AVX-NEXT:    vmovaps -{{[0-9]+}}(%rsp), %xmm0
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <2 x double> undef, double %x, i32 %y
  ret <2 x double> %ins
}

define <32 x i8> @arg_i8_v32i8(i8 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i8_v32i8:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $31, %esi
; SSE-NEXT:    movb %dil, (%rsp,%rsi)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i8_v32i8:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $31, %esi
; AVX-NEXT:    movb %dil, (%rsp,%rsi)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <32 x i8> undef, i8 %x, i32 %y
  ret <32 x i8> %ins
}

define <16 x i16> @arg_i16_v16i16(i16 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i16_v16i16:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $15, %esi
; SSE-NEXT:    movw %di, (%rsp,%rsi,2)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i16_v16i16:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $15, %esi
; AVX-NEXT:    movw %di, (%rsp,%rsi,2)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <16 x i16> undef, i16 %x, i32 %y
  ret <16 x i16> %ins
}

define <8 x i32> @arg_i32_v8i32(i32 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i32_v8i32:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $7, %esi
; SSE-NEXT:    movl %edi, (%rsp,%rsi,4)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i32_v8i32:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $7, %esi
; AVX-NEXT:    movl %edi, (%rsp,%rsi,4)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <8 x i32> undef, i32 %x, i32 %y
  ret <8 x i32> %ins
}

define <4 x i64> @arg_i64_v4i64(i64 %x, i32 %y) nounwind {
; SSE-LABEL: arg_i64_v4i64:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movq %rdi, (%rsp,%rsi,8)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_i64_v4i64:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    movq %rdi, (%rsp,%rsi,8)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <4 x i64> undef, i64 %x, i32 %y
  ret <4 x i64> %ins
}

define <8 x float> @arg_f32_v8f32(float %x, i32 %y) nounwind {
; SSE-LABEL: arg_f32_v8f32:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $edi killed $edi def $rdi
; SSE-NEXT:    andl $7, %edi
; SSE-NEXT:    movss %xmm0, (%rsp,%rdi,4)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_f32_v8f32:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $edi killed $edi def $rdi
; AVX-NEXT:    andl $7, %edi
; AVX-NEXT:    vmovss %xmm0, (%rsp,%rdi,4)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <8 x float> undef, float %x, i32 %y
  ret <8 x float> %ins
}

define <4 x double> @arg_f64_v4f64(double %x, i32 %y) nounwind {
; SSE-LABEL: arg_f64_v4f64:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $edi killed $edi def $rdi
; SSE-NEXT:    andl $3, %edi
; SSE-NEXT:    movsd %xmm0, (%rsp,%rdi,8)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: arg_f64_v4f64:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $edi killed $edi def $rdi
; AVX-NEXT:    andl $3, %edi
; AVX-NEXT:    vmovsd %xmm0, (%rsp,%rdi,8)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %ins = insertelement <4 x double> undef, double %x, i32 %y
  ret <4 x double> %ins
}

define <32 x i8> @load_i8_v32i8(i8* %p, i32 %y) nounwind {
; SSE-LABEL: load_i8_v32i8:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movb (%rdi), %al
; SSE-NEXT:    andl $31, %esi
; SSE-NEXT:    movb %al, (%rsp,%rsi)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i8_v32i8:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movb (%rdi), %al
; AVX-NEXT:    andl $31, %esi
; AVX-NEXT:    movb %al, (%rsp,%rsi)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <32 x i8> undef, i8 %x, i32 %y
  ret <32 x i8> %ins
}

define <16 x i16> @load_i16_v16i16(i16* %p, i32 %y) nounwind {
; SSE-LABEL: load_i16_v16i16:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    andl $15, %esi
; SSE-NEXT:    movw %ax, (%rsp,%rsi,2)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i16_v16i16:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    andl $15, %esi
; AVX-NEXT:    movw %ax, (%rsp,%rsi,2)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <16 x i16> undef, i16 %x, i32 %y
  ret <16 x i16> %ins
}

define <8 x i32> @load_i32_v8i32(i32* %p, i32 %y) nounwind {
; SSE-LABEL: load_i32_v8i32:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movl (%rdi), %eax
; SSE-NEXT:    andl $7, %esi
; SSE-NEXT:    movl %eax, (%rsp,%rsi,4)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i32_v8i32:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movl (%rdi), %eax
; AVX-NEXT:    andl $7, %esi
; AVX-NEXT:    movl %eax, (%rsp,%rsi,4)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <8 x i32> undef, i32 %x, i32 %y
  ret <8 x i32> %ins
}

define <4 x i64> @load_i64_v4i64(i64* %p, i32 %y) nounwind {
; SSE-LABEL: load_i64_v4i64:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movq (%rdi), %rax
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movq %rax, (%rsp,%rsi,8)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_i64_v4i64:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    movq (%rdi), %rax
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    movq %rax, (%rsp,%rsi,8)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <4 x i64> undef, i64 %x, i32 %y
  ret <4 x i64> %ins
}

define <8 x float> @load_f32_v8f32(float* %p, i32 %y) nounwind {
; SSE-LABEL: load_f32_v8f32:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    andl $7, %esi
; SSE-NEXT:    movss %xmm0, (%rsp,%rsi,4)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_f32_v8f32:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    andl $7, %esi
; AVX-NEXT:    vmovss %xmm0, (%rsp,%rsi,4)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <8 x float> undef, float %x, i32 %y
  ret <8 x float> %ins
}

define <4 x double> @load_f64_v4f64(double* %p, i32 %y) nounwind {
; SSE-LABEL: load_f64_v4f64:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rbp
; SSE-NEXT:    movq %rsp, %rbp
; SSE-NEXT:    andq $-32, %rsp
; SSE-NEXT:    subq $64, %rsp
; SSE-NEXT:    # kill: def $esi killed $esi def $rsi
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    andl $3, %esi
; SSE-NEXT:    movsd %xmm0, (%rsp,%rsi,8)
; SSE-NEXT:    movaps (%rsp), %xmm0
; SSE-NEXT:    movaps {{[0-9]+}}(%rsp), %xmm1
; SSE-NEXT:    movq %rbp, %rsp
; SSE-NEXT:    popq %rbp
; SSE-NEXT:    retq
;
; AVX-LABEL: load_f64_v4f64:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rbp
; AVX-NEXT:    movq %rsp, %rbp
; AVX-NEXT:    andq $-32, %rsp
; AVX-NEXT:    subq $64, %rsp
; AVX-NEXT:    # kill: def $esi killed $esi def $rsi
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    andl $3, %esi
; AVX-NEXT:    vmovsd %xmm0, (%rsp,%rsi,8)
; AVX-NEXT:    vmovaps (%rsp), %ymm0
; AVX-NEXT:    movq %rbp, %rsp
; AVX-NEXT:    popq %rbp
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <4 x double> undef, double %x, i32 %y
  ret <4 x double> %ins
}


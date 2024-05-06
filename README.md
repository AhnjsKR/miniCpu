# 구성 요소
1. fullAdder : 1bit full adder
2. fullAdder_8bit : fullAdder조합으로 구성
3. ALU.v : ADD 와 SUB, AND, OR 연산 지원
---
**SimpleCPU**


clk, reset, instruction을 input으로 acc를 output으로 설정.


간단한 FETCH-DECODE-EXECUTE 사이클 동작.


---

**TB**


ADD와 SUB 명령어 test

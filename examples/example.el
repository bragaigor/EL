MyProgram

DEF myFunc 2
	PUSH_ARG 0
	PUSH_ARG 1
	ADD
	RET
end

DEF main 0
	PUSH_CONSTANT 7
	PUSH_CONSTANT 3
	PUSH_CONSTANT 2
	ADD
	PRINT_STRING "before call\n"
	CALL myFunc 2
	PRINT_STRING "after call\n"
	CALL foobar 0
	PRINT_STRING "after call 2\n"
	POP
	CALL fib 1
	PUSH_CONSTANT 12
	DIV
	CALL iterFib 1
	POP
	CALL testprint 0
	POP
	
	// Call fib(36) and print the result and how long it took 20 times
	PUSH_CONSTANT 20
	POP_LOCAL 2
	PUSH_CONSTANT 0
	POP_LOCAL 1
LOOP_START:
	PUSH_CONSTANT 36
	CURRENT_TIME
	POP_LOCAL 0
	CALL fib 1
	CURRENT_TIME
	PUSH_LOCAL 0
	SUB
	POP_LOCAL 0
	PRINT_STRING "Fib(36) = "
	PRINT_INT64
	PRINT_STRING " executed in "
	PUSH_LOCAL 0
	PRINT_INT64
	PRINT_STRING "ms\n"

	PUSH_LOCAL 1
	PUSH_CONSTANT 1
	ADD
	DUP
	POP_LOCAL 1
	PUSH_LOCAL 2
	JMPL LOOP_START
	
	
	PUSH_CONSTANT 1
	RET
end

DEF fib 1
	//PRINT_STRING "In Fib\n"
	PUSH_ARG 0
	DUP
	//PRINT_STRING "after dup\n"
	POP_LOCAL 0
	PUSH_CONSTANT 2
	//PRINT_STRING "before jmpl\n"
	JMPL B2
	//PRINT_STRING "fallthrough jmpl1\n"
	PUSH_LOCAL 0
	PUSH_CONSTANT 1
	SUB
	//PRINT_STRING "before fib call1\n"
	CALL fib 1
	//PRINT_STRING "after fib call1\n"
	POP_LOCAL 1
	PUSH_LOCAL 0
	PUSH_CONSTANT 2
	SUB
	CALL fib 1
	POP_LOCAL 0
	PUSH_LOCAL 1
	PUSH_LOCAL 0
	ADD
	RET
B2:
	//PRINT_STRING "taken jmpl\n"
	PUSH_LOCAL 0
	RET
end

DEF test 0
	PUSH_CONSTANT 2
	PUSH_CONSTANT 3
	MUL
	RET
end

DEF foobar 0
	PUSH_CONSTANT 5
	RET
end

DEF teststacksize 0
	PUSH_CONSTANT 3
	PUSH_CONSTANT 5
	PUSH_CONSTANT 7
	JMPL L1
	PUSH_CONSTANT 4
	JMPL L2
L3:
	PUSH_CONSTANT 2
	PUSH_CONSTANT 1
	PUSH_CONSTANT 6
	JMPL L1
	PUSH_CONSTANT 8
	JMPL L3
	PUSH_CONSTANT 10
	RET
L1:
	RET
L2:
	PUSH_CONSTANT 9
	RET
end

DEF teststacksize2 0
	PUSH_CONSTANT 1
	PUSH_CONSTANT 2
	PUSH_CONSTANT 3
	JMPL L1
	POP
	PUSH_CONSTANT 4
L1:
	RET
end

DEF iterFib 1
	PUSH_ARG 0
	DUP
	POP_LOCAL 0
	PUSH_CONSTANT 1
	JMPL L1
	PUSH_CONSTANT 1
	POP_LOCAL 1
	PUSH_CONSTANT 0
	POP_LOCAL 2
	PUSH_CONSTANT 1
	POP_LOCAL 3
L2:
	PUSH_LOCAL 1
	PUSH_LOCAL 2
	PUSH_LOCAL 1
	POP_LOCAL 2
	ADD
	POP_LOCAL 1
	PUSH_LOCAL 3
	PUSH_CONSTANT 1
	ADD
	DUP
	POP_LOCAL 3
	PUSH_LOCAL 0
	JMPL L2
	PUSH_LOCAL 1
	RET
L1:
	PUSH_LOCAL 0
	RET
end

DEF testprint 0
	PRINT_STRING "The current time in millis is "
	CURRENT_TIME
	PRINT_INT64
	PRINT_STRING "\n"
	PUSH_CONSTANT 5
	RET
end

DEF testcomments 0
	PUSH_CONSTANT 1
	// Tabbed comment
	PUSH_CONSTANT 2
// Untabbed comment
	ADD
	// first of 2 comments one after the other
	// second comment
	RET //comment
end
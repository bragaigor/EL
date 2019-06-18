# Welcome to EL!

EL is an educational language runtime and programming language! We’re using it to show people how to use [Eclipse OMR] to build their own language runtime with a Just in Time (JIT) Compiler!

[Eclipse OMR]: https://github.com/eclipse/omr

## Getting started

### 1. Requirements

To get started with EL you will need the following:

* `git`
* `build-essential`
* `cmake` **(Minimum version 3.2.0)**

### 2. Clone the repository and get the submodules

```sh
git clone --recursive https://github.com/bragaigor/EL.git
```

### 3. Build EL

```sh
cd EL \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make
```

### 4. Run a program

In the build folder:

### 4.1. Compile
```sh
bytecodecompiler/elc ../examples/test.el
```

### 4.2.1 Run with C Compiler
```sh
runtime/el -it 0 test.le
```

### 4.2.2 Run with JitBuilder Compiler
```sh
runtime/el -it 1 test.le
```

### 4.2.3 Run with InterpreterBuidler Compiler
```sh
runtime/el -it 2 test.le
```

To see real performance differences, do the above steps with programs that start with `perf_`
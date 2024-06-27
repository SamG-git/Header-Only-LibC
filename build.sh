#!/bin/bash 

mkdir -p bin/ lib/

# Create header only malloc test
gcc -Wall -o bin/malloc_header_test -DHEADER_MALLOC -Ilibc/include benchmarks/malloc_test.c 

# Create inline malloc test
gcc -Wall -o bin/malloc_inline_test -DINLINE_MALLOC -Ilibc/include benchmarks/malloc_test.c

# Create malloc object
gcc -Wall -c -o lib/malloc.o libc/src/malloc.c

# Create malloc static library
ar rcs lib/malloc.a lib/malloc.o

# Create malloc shared library
gcc -Wall -fPIC -shared -o lib/malloc.so libc/src/malloc.c

# Create object linked malloc test
gcc -Wall -o bin/malloc_object_test -DLINKED_MALLOC -Ilibc/include lib/malloc.o benchmarks/malloc_test.c

# Create symbolically linked malloc test
gcc -Wall -o bin/malloc_symlink_test -DLINKED_MALLOC -Ilibc/include  benchmarks/malloc_test.c lib/malloc.so

# Create statically linked malloc test
gcc -Wall -o bin/malloc_staticlink_test -DLINKED_MALLOC -Ilibc/include  benchmarks/malloc_test.c lib/malloc.a
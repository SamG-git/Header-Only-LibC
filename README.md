# Header Only LibC Experiments

The goal of this project is to analyse the impact of using header-only variants 
of standard functions provided as part of libc. The following libc functions are
implemented:

- ``malloc()`` and ``free()``

More functions will be added in future.

Each function gets three implementations:

1. A standard header-and-source implementation for static and dynamic linking.
2. A header only variant.
3. A header only variant using the ``inline`` keyword.

This allows five test cases for each function:

1. An implementation using a linked shared object.
2. An implementation using a linked static object.
3. An implementation using a standard .o object.
4. An implementation using the header only variant.
5. An implementation using the header only variant with the ``inline`` keyword

## Benchmarks

The current benchmark allocates a large linked list, then deallocates it. This 
is then timed. More benchmarks will be added in future.




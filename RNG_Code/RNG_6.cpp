//Random Number Generator, fastest possible implementation in C++, novel approaches allowed, 
// output 1 float per call, entropy conserving, prioritize statistical distribution,
// aggressive statistical excellence, no abstractions, no readability

#include <stdint.h>

static uint64_t state = 0x853c49e6748fea9bULL;
static uint64_t inc = 0xda3e39cb94b95bdbULL;

inline uint32_t pcg32() {
    uint64_t oldstate = state;
    state = oldstate * 6364136223846793005ULL + inc;
    uint32_t xorshifted = ((oldstate >> 18u) ^ oldstate) >> 27u;
    uint32_t rot = oldstate >> 59u;
    return (xorshifted >> rot) | (xorshifted << ((-rot) & 31));
}

inline float fast_random_float() {
    uint32_t x = pcg32();
    x = (x >> 9) | 0x3f800000; // 23 bits of mantissa, exponent = 127
    float f = *(float*)&x;
    return f - 1.0f;
}
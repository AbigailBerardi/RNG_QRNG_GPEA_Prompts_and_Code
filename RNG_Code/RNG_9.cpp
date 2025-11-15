//Random Number Generator, fastest possible implementation in C++, perfect uniform distribution, 
// output 1 float per call, prioritize statistically independent samples, seed with time, no abstractions, 
// no readability

//Here's a minimal and fast C++ implementation of a random number generator optimized for speed, 
// statistical independence, and perfect uniformity over the [0.0f, 1.0f) range using a high-quality PRNG. 
// It uses xoshiro128++, which is fast, statistically robust, and outputs high-quality random floats.

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <cstdint>

// RNG state
static uint32_t s[4];

static inline uint32_t rotl(const uint32_t x, int k) {
    return (x << k) | (x >> (32 - k));
}

static inline void seed(uint32_t t) {
    s[0] = t ^ 0x9E3779B9u;
    s[1] = t ^ 0x243F6A88u;
    s[2] = t ^ 0xB7E15162u;
    s[3] = t ^ 0xDEADBEEFu;
}

static inline uint32_t next_u32() {
    uint32_t const result = rotl(s[0] + s[3], 7) + s[0];
    uint32_t const t = s[1] << 9;
    s[2] ^= s[0];
    s[3] ^= s[1];
    s[1] ^= s[2];
    s[0] ^= s[3];
    s[2] ^= t;
    s[3] = rotl(s[3], 11);
    return result;
}

static inline float next_f32() {
    return (next_u32() >> 8) * (1.0f / 16777216.0f); // 24-bit float in [0,1)
}


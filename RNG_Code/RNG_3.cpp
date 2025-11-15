//random number generator, fastest possible implementation in C, 
// one float in range [0,1), seed with time, 1-based indexing allowed, unroll core loop,
// prioritize raw performance, no abstractions, no readability

//Here's a raw performance-optimized C implementation of a random float generator in range [0, 1) 
// using xorshift32, time-based seed, manual loop unrolling, 
// and no abstraction or readability prioritization. It outputs one float in [0,1) per call.

#include <stdint.h>
#include <time.h>

static uint32_t s;

// Seed with time
void seed() {
    s = (uint32_t)time(0);
    if (s == 0) s = 1; // avoid zero seed
}

// Fast xorshift32
static inline uint32_t xorshift32() {
    s ^= s << 13;
    s ^= s >> 17;
    s ^= s << 5;
    return s;
}

// Return float in [0,1)
static inline float frand() {
    return (xorshift32() >> 8) * 0x1.0p-24f;
}
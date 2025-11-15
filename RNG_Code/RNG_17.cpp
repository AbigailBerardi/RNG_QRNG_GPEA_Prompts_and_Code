//Random Number Generator, fastest possible implementation in C++, novel approaches allowed, 
// output 1 float per call, entropy conserving, prioritize statistical distribution, seed with time, 
// no abstractions, no readability

//ChatGPT said :
//Here is an ultra - fast, entropy - conserving, statistically sound random number generator in C++ that 
// outputs a float on each call.It uses a xorshift128 + core, adapted for speed and seeded with time.No 
// abstractions, minimal readability, and maximum performance focus.

#include <stdint.h>
#include <time.h>

uint64_t s[2];

static inline void seed() {
    uint64_t t = (uint64_t)time(0);
    s[0] = t ^ 0x9E3779B97F4A7C15;
    s[1] = t << 17 | t >> 47;
}

static inline uint64_t xorshift128plus() {
    uint64_t x = s[0], y = s[1];
    s[0] = y;
    x ^= x << 23;
    s[1] = x ^ y ^ (x >> 17) ^ (y >> 26);
    return s[1] + y;
}

static inline float randf() {
    uint32_t u = xorshift128plus() >> 40; // top 24 bits
    return (float)u * 5.9604645e-8f; // 1/2^24
}

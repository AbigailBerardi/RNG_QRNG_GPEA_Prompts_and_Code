//Random Number Generator, fastest possible implementation in C++, novel approaches allowed, 
// output 1 float per call, entropy conserving, prioritize statistical distribution, seed with time, 
// no abstractions, no readability

//Here's a minimal, fast, entropy-conserving C++ random number generator that outputs 1 float per call. 
// It uses Xoshiro128**, which is fast and statistically robust. The implementation is optimized for
// speed with no abstractions, minimal readability, no classes or templates, and uses bitwise manipulation. 
// It's seeded with system time, and floats are generated in[0, 1) using fast float conversion.

#include <cstdint>
#include <ctime>
#include <iostream>

static uint32_t s[4];

inline uint32_t rotl(const uint32_t x, int k) {
    return (x << k) | (x >> (32 - k));
}

inline void seed() {
    uint32_t t = (uint32_t)time(0);
    for (int i = 0; i < 4; ++i) {
        t ^= t >> 13; t ^= t << 17; t ^= t >> 5;
        s[i] = t;
    }
}

inline uint32_t xoshiro128ss() {
    uint32_t result = rotl(s[1] * 5, 7) * 9;
    uint32_t t = s[1] << 9;
    s[2] ^= s[0]; s[3] ^= s[1]; s[1] ^= s[2]; s[0] ^= s[3];
    s[2] ^= t; s[3] = rotl(s[3], 11);
    return result;
}

inline float randf() {
    return (xoshiro128ss() >> 8) * 0x1.0p-24f; // Convert to float in [0,1)
}

int main() {
    seed();
    for (int i = 0; i < 10; ++i) std::cout << randf() << '\n';
}
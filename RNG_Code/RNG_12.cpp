//Random Number Generator, fastest possible implementation in C++, perfect uniform distribution, 
// novel approaches allowed, output 1 float per call, prioritize statistically independent samples, 
// seed with time, no abstractions, no readability

#include <cstdint>
#include <chrono>
#include <iostream>

uint64_t s[4];

inline uint64_t rotl(const uint64_t x, int k) {
    return (x << k) | (x >> (64 - k));
}

inline void seed() {
    uint64_t t = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    for (int i = 0; i < 4; ++i) {
        t ^= t >> 33; t *= 0xff51afd7ed558ccdULL;
        t ^= t >> 33; t *= 0xc4ceb9fe1a85ec53ULL;
        t ^= t >> 33;
        s[i] = t;
    }
}

inline uint64_t next() {
    const uint64_t r = rotl(s[0] + s[3], 23) + s[0];
    const uint64_t t = s[1] << 17;
    s[2] ^= s[0]; s[3] ^= s[1]; s[1] ^= s[2]; s[0] ^= s[3];
    s[2] ^= t;
    s[3] = rotl(s[3], 45);
    return r;
}

inline float next_float() {
    return (next() >> 40) * 0x1.0p-24f;
}

int main() {
    seed();
    for (int i = 0; i < 10; ++i)
        std::cout << next_float() << '\n';
}
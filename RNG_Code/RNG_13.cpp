//Random Number Generator, fastest possible implementation in C++, novel approaches allowed, 
// output 1 float per call, entropy conserving, prioritize statistical distribution, 
// aggressive statistical excellence, seed with time, no abstractions, no readability

#include <cstdint>
#include <ctime>

static uint64_t s[4];

static inline uint64_t rotl(const uint64_t x, int k) {
    return (x << k) | (x >> (64 - k));
}

static inline void seed() {
    uint64_t x = (uint64_t)time(0);
    for (int i = 0; i < 4; ++i) {
        x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
        s[i] = x * 0x2545F4914F6CDD1DULL;
    }
}

static inline uint64_t next_u64() {
    const uint64_t result = rotl(s[0] + s[3], 23) + s[0];
    const uint64_t t = s[1] << 17;
    s[2] ^= s[0];
    s[3] ^= s[1];
    s[1] ^= s[2];
    s[0] ^= s[3];
    s[2] ^= t;
    s[3] = rotl(s[3], 45);
    return result;
}

static inline float next_float() {
    union { uint32_t i; float f; } u;
    u.i = 0x3F800000U | (next_u64() >> 41); // 23 bits mantissa
    return u.f - 1.0f;
}

//Random number generator, fastest possible implementation in C++, output one float value per 
// function call in range [0,1), conserve entropy, initialize internal state with time-based seed,
// prioritize float uniformity, no abstractions, no comments or formatting.

#include <cstdint>
#include <ctime>

static uint64_t s;

inline void seed() {
    s = (uint64_t)time(0) ^ 0x9E3779B97F4A7C15;
}

inline float rng() {
    s ^= s >> 12;
    s ^= s << 25;
    s ^= s >> 27;
    uint64_t z = s * 0x2545F4914F6CDD1D;
    return (z >> 40) * (1.0f / 16777216.0f);
}
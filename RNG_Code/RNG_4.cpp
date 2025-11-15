//random number generator, greatest possible statistical distribution, fastest possible implementation in C++,
//one 32bit float in range[0, 1), seed with time, 1 - based indexing allowed, 
//prioritize entropy compression, no detectable bias, no readability


#include <cstdint>
#include <ctime>

static uint64_t s = (uint64_t)time(0) ^ 0x9E3779B97F4A7C15ULL;

inline float rng() {
    s ^= s >> 12;
    s ^= s << 25;
    s ^= s >> 27;
    uint32_t r = (uint32_t)((s * 0x2545F4914F6CDD1DULL) >> 32);
    r = (r >> 9) | 0x3F800000;
    float f;
    *((uint32_t*)&f) = r;
    return f - 1.0f;
}
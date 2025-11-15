// random number generator, fastest possible implementation in C++, output one float value per function 
// call in range [0,1), conserve entropy, seed with time(0), prioritize float uniformity, no abstractions, 
// no comments or formatting

#include <ctime>
#include <cstdint>

static uint64_t s = time(0);

float rand01() {
    s ^= s >> 12;
    s ^= s << 25;
    s ^= s >> 27;
    uint64_t r = s * 2685821657736338717ull;
    return (r >> 40) * (1.0f / 16777216.0f);
}

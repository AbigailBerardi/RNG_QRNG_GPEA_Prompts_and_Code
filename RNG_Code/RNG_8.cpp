//random number generator, fast implementation in C++, output one float per call in range[0, 1), 
// conserve entropy, seed with time(0), no global state, no functions, no comments or formatting

#include <ctime>
#include <cstdint>
#include <iostream>

struct RNG {
    uint64_t s;
    RNG() : s(time(0)) {}
    float next() {
        s ^= s >> 12;
        s ^= s << 25;
        s ^= s >> 27;
        return (s * 2685821657736338717ULL >> 40) * (1.0f / (1ULL << 24));
    }
};

int main() {
    RNG rng;
    std::cout << rng.next() << std::endl;
}
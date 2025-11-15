//random number generator, fast implementation in C++, float output in range[0, 1),
//seed with time(0), no global state, no functions, no comments or formatting

//The code uses a simplified version of a Linear Congruential Generator (LCG), which is a basic and 
// fast pseudorandom number generator defined by the recurrence:


#include <iostream>
#include <ctime>
#include <cstdint>

int main() {
    uint64_t seed = static_cast<uint64_t>(time(0));
    uint64_t state = seed ^ 0x5DEECE66DULL;
    state = (state * 0x5851F42D4C957F2DULL + 1) & ((1ULL << 48) - 1);
    float result = static_cast<float>(state >> 24) / (1 << 24);
    std::cout << result << std::endl;
    return 0;
}
